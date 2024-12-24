// this file is duplicated in `backend/src/config/logos.js` and `webapp/constants/logos.js` and replaced on rebranding
// this are the paths in the webapp
export default {
  LOGO_HEADER_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=7',
  LOGO_HEADER_WIDTH: '40px',
  LOGO_HEADER_CLICK: {
    // externalLink: {
    //   url: 'https://ocelot.social',
    //   target: '_blank',
    // },
    externalLink: null,
    internalPath: {
      to: {
        name: 'index',
      },
      scrollTo: '.main-navigation',
    },
  },
  LOGO_SIGNUP_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=75',
  LOGO_WELCOME_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=75',
  LOGO_LOGOUT_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=75',
  LOGO_PASSWORD_RESET_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=75',
  LOGO_MAINTENACE_RESET_PATH: 'https://outlook.ignitespring.io/_next/image?url=%2FIS-logo.png&w=256&q=75',
}
