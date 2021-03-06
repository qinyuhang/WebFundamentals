<!DOCTYPE html>
<html lang="{{ lang }}" class="no-js no-touch">
  <head>
    <meta charset="utf-8" />

    {% include content %}


    {% comment %}
      Simple navigation enhancement JS

      I was unable to add JS comments because it
      breaks the build for some weird reason,
      but this is all we should need really

      Most of the code is just some helper functions.
    {% endcomment %}

    <script type="text/javascript">
      (function(document) {
            var toggleDocumentationMenu = function() {
              var navBtn = document.querySelector('.main-nav__btn');
              var navList = document.querySelector('.main-nav__list');
              var navIsOpenedClass = 'nav-is-opened';
              var navListIsOpened = false;

              navBtn.addEventListener('click', function (event) {
                event.preventDefault();

                if (!navListIsOpened) {
                  addClass(navList, navIsOpenedClass);
                  navListIsOpened = true;
                } else {
                  removeClass(navList, navIsOpenedClass);
                  navListIsOpened = false;
                }
              });
            }

            var toggleMainNav = function() {
              var documentationItem =
                  document.querySelector('.main-nav__item--documentation');
              var documentationLink =
                  document.querySelector('.main-nav__item--documentation > .main-nav__link');
              var documentationIsOpenedClass = 'subnav-is-opened';
              var documentationIsOpened = false;

              if (documentationLink) {
                documentationLink.addEventListener('click', function (event) {
                  event.preventDefault();

                  if (!documentationIsOpened) {
                    documentationIsOpened = true;
                    addClass(documentationItem, documentationIsOpenedClass);
                  } else {
                    documentationIsOpened = false;
                    removeClass(documentationItem, documentationIsOpenedClass);
                  }

                });
              }
            }

            var isTouch = function() {
              return ('ontouchstart' in window) ||
                window.DocumentTouch && document instanceof DocumentTouch;
            };

            var addClass = function (element, className) {
              if (!element) { return; }
              element.className = element.className.replace(/\s+$/gi, '') + ' ' + className;
            }

            var removeClass = function(element, className) {
              if (!element) { return; }
              element.className = element.className.replace(className, '');
            }

            var html = document.querySelector('html');
            removeClass(html, 'no-js');
            addClass(html, 'js');

            if (isTouch()) {
              removeClass(html, 'no-touch');
              addClass(html, 'is-touch');
            }

            toggleDocumentationMenu();
            toggleMainNav();
          })(document);
    </script>
  </body>
</html>
