@interface SoftwareUpdateExtensibleSSOAuthenticator
- (ASAuthorizationController)authenticationController;
- (BOOL)authenticationSupported;
- (NSDictionary)otherParameters;
- (NSString)appIdentifier;
- (NSString)envIdentifier;
- (NSString)interactivity;
- (NSString)username;
- (SoftwareUpdateExtensibleSSOAuthenticatorDelegate)delegate;
- (id)copyQueryItemsWithParameters:(id)a3;
- (void)authenticate;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvIdentifier:(id)a3;
- (void)setInteractivity:(id)a3;
- (void)setOtherParameters:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation SoftwareUpdateExtensibleSSOAuthenticator

- (id)copyQueryItemsWithParameters:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2;
  v12 = &unk_2647EE7E0;
  id v13 = v5;
  id v14 = &__block_literal_global;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  v7 = [v6 copy:v9, v10, v11, v12];
  return v7;
}

void __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    v8 = [MEMORY[0x263F08BD0] queryItemWithName:v6 value:v7];
    if (v8) {
      [v9 addObject:v8];
    }
  }
}

uint64_t __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)authenticate
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = SoftwareUpdateSSOlogInfo();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226EA1000, v3, OS_LOG_TYPE_DEFAULT, "Authenticating with AuthenticationServices.\n", buf, 2u);
  }

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self appIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"applicationIdentifier"];

  id v6 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self envIdentifier];
  [v4 setObject:v6 forKeyedSubscript:@"environmentIdentifier"];

  id v7 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self username];
  [v4 setObject:v7 forKeyedSubscript:@"username"];

  v8 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self interactivity];
  [v4 setObject:v8 forKeyedSubscript:@"interactivity"];

  id v9 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self otherParameters];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F08BA0]);
    v11 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self otherParameters];
    id v12 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self copyQueryItemsWithParameters:v11];
    [v10 setQueryItems:v12];

    id v13 = [v10 query];

    if (v13)
    {
      id v14 = [v10 query];
      [v4 setObject:v14 forKeyedSubscript:@"otherParameters"];
    }
  }
  v15 = SoftwareUpdateSSOlogInfo();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self appIdentifier];
    v17 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self envIdentifier];
    v18 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self interactivity];
    *(_DWORD *)buf = 138412802;
    v40 = v16;
    __int16 v41 = 2112;
    v42 = v17;
    __int16 v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_226EA1000, v15, OS_LOG_TYPE_DEFAULT, "Parameters passed to authenticate function are AppIdentifier: %@ EnvIdentifier: %@ Interactivity: %@ \n", buf, 0x20u);
  }
  v19 = [NSURL URLWithString:@"https://sso.corp.apple.com/authenticate"];
  v20 = [MEMORY[0x263EFC3D0] authorizationProviderWithIdentityProviderURL:v19];
  if ([v20 canPerformAuthorization])
  {
    v21 = [v20 createRequest];
    if (!v21)
    {
      v24 = SoftwareUpdateSSOlogError();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Unable to create request object\n";
LABEL_30:
        v26 = v24;
        uint32_t v27 = 2;
        goto LABEL_31;
      }
LABEL_32:

      goto LABEL_33;
    }
    id v22 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self copyQueryItemsWithParameters:v4];
    [v21 setAuthorizationOptions:v22];

    v23 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self interactivity];
    if ([v23 isEqualToString:@"0"])
    {
    }
    else
    {
      v28 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self interactivity];
      int v29 = [v28 isEqualToString:@"2"];

      if (!v29)
      {
        v30 = SoftwareUpdateSSOlogInfo();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226EA1000, v30, OS_LOG_TYPE_DEFAULT, "Setting userInterfaceEnabled to NO\n", buf, 2u);
        }
        uint64_t v31 = 0;
LABEL_24:

        [v21 setUserInterfaceEnabled:v31];
        id v32 = objc_alloc(MEMORY[0x263EFC388]);
        v38 = v21;
        v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
        v34 = (void *)[v32 initWithAuthorizationRequests:v33];
        [(SoftwareUpdateExtensibleSSOAuthenticator *)self setAuthenticationController:v34];

        v35 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self authenticationController];

        if (v35)
        {
          v36 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self authenticationController];
          [v36 setDelegate:self];

          v37 = SoftwareUpdateSSOlogDebug();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226EA1000, v37, OS_LOG_TYPE_DEFAULT, "Calling performRequests on authenticationController\n", buf, 2u);
          }

          v24 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self authenticationController];
          [v24 performRequests];
          goto LABEL_32;
        }
        v24 = SoftwareUpdateSSOlogError();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v25 = "Unable to allocate AuthenticationController object\n";
          goto LABEL_30;
        }
        goto LABEL_32;
      }
    }
    v30 = SoftwareUpdateSSOlogInfo();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226EA1000, v30, OS_LOG_TYPE_DEFAULT, "Setting userInterfaceEnabled to YES\n", buf, 2u);
    }
    uint64_t v31 = 1;
    goto LABEL_24;
  }
  v21 = SoftwareUpdateSSOlogError();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v20 url];
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    v25 = "Can't authenticate with provider URL: %@\n";
    v26 = v21;
    uint32_t v27 = 12;
LABEL_31:
    _os_log_impl(&dword_226EA1000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_32;
  }
LABEL_33:
}

- (BOOL)authenticationSupported
{
  if (objc_opt_class())
  {
    v2 = [NSURL URLWithString:@"https://sso.corp.apple.com/authenticate"];
    v3 = [MEMORY[0x263EFC3D0] authorizationProviderWithIdentityProviderURL:v2];
    char v4 = [v3 canPerformAuthorization];

    return v4;
  }
  else
  {
    id v6 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_226EA1000, v6, OS_LOG_TYPE_DEFAULT, "Environment does not support AuthenticationServices\n", v7, 2u);
    }

    return 0;
  }
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5 = a4;
  id v6 = SoftwareUpdateSSOlogInfo();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_226EA1000, v6, OS_LOG_TYPE_DEFAULT, "INFO: ExtensibleSSOAuthenticator: Authentication completed successfully\n", v12, 2u);
  }

  id v7 = [v5 credential];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v5 credential];
    id v9 = [v8 authenticatedResponse];
  }
  else
  {
    id v9 = 0;
  }

  id v10 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self delegate];
  v11 = [v9 allHeaderFields];
  [v10 authenticator:self didCompleteWithResult:v11];

  [(SoftwareUpdateExtensibleSSOAuthenticator *)self setAuthenticationController:0];
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = SoftwareUpdateSSOlogError();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_226EA1000, v6, OS_LOG_TYPE_DEFAULT, "ExtensibleSSOAuthenticator : Authentication completed with error: %@\n", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(SoftwareUpdateExtensibleSSOAuthenticator *)self delegate];
  [v7 authenticator:self didCompleteWithError:v5];

  [(SoftwareUpdateExtensibleSSOAuthenticator *)self setAuthenticationController:0];
}

- (SoftwareUpdateExtensibleSSOAuthenticatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SoftwareUpdateExtensibleSSOAuthenticatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)envIdentifier
{
  return self->_envIdentifier;
}

- (void)setEnvIdentifier:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)interactivity
{
  return self->_interactivity;
}

- (void)setInteractivity:(id)a3
{
}

- (NSDictionary)otherParameters
{
  return self->_otherParameters;
}

- (void)setOtherParameters:(id)a3
{
}

- (ASAuthorizationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_otherParameters, 0);
  objc_storeStrong((id *)&self->_interactivity, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end