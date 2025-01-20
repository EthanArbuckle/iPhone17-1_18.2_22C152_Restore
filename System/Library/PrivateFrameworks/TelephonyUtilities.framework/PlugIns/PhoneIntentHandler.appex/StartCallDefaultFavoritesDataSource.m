@interface StartCallDefaultFavoritesDataSource
- (BOOL)hasFavoritesEntryForContact:(id)a3;
- (BOOL)hasFavoritesEntryForTelephonyCallWithPhoneNumber:(id)a3 isoCountryCodes:(id)a4;
- (CNFavorites)favoritesController;
- (StartCallDefaultFavoritesDataSource)initWithCallCenter:(id)a3;
- (TUCallCenter)callCenter;
@end

@implementation StartCallDefaultFavoritesDataSource

- (StartCallDefaultFavoritesDataSource)initWithCallCenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)StartCallDefaultFavoritesDataSource;
  v6 = [(StartCallDefaultFavoritesDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callCenter, a3);
  }

  return v7;
}

- (CNFavorites)favoritesController
{
  favoritesController = self->_favoritesController;
  if (!favoritesController)
  {
    id v4 = objc_alloc((Class)CNFavorites);
    id v5 = [(TUCallCenter *)self->_callCenter contactStore];
    v6 = (CNFavorites *)[v4 initWithContactStore:v5];
    v7 = self->_favoritesController;
    self->_favoritesController = v6;

    favoritesController = self->_favoritesController;
  }

  return favoritesController;
}

- (BOOL)hasFavoritesEntryForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(StartCallDefaultFavoritesDataSource *)self favoritesController];
  v6 = [v5 entriesForContact:v4];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (BOOL)hasFavoritesEntryForTelephonyCallWithPhoneNumber:(id)a3 isoCountryCodes:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v7 = [(StartCallDefaultFavoritesDataSource *)self favoritesController];
  v8 = [v7 entries];

  id v9 = [v8 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (!v9) {
    goto LABEL_29;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v40;
  v32 = (void *)CNActionBundleIdentifierPhone;
  v33 = (void *)CNActionTypeAudioCall;
  v28 = v8;
  id v29 = v6;
  uint64_t v30 = *(void *)v40;
  do
  {
    v12 = 0;
    id v31 = v10;
    do
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v12);
      v14 = objc_msgSend(v13, "actionType", v28, v29);
      if ([v33 isEqualToString:v14])
      {
        v15 = [v13 bundleIdentifier];
        unsigned int v16 = [v32 isEqualToString:v15];

        if (!v16) {
          goto LABEL_27;
        }
        v14 = [v13 contactProperty];
        v17 = [v14 value];
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = [v17 stringValue];
          if ([v18 length])
          {
            v19 = [objc_alloc((Class)TUHandle) initWithType:2 value:v18];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v20 = v6;
            id v21 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v36;
              while (2)
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(void *)v36 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  if ([v19 isCanonicallyEqualToHandle:v34 isoCountryCode:*(void *)(*((void *)&v35 + 1) + 8 * i)])
                  {
                    v26 = IntentHandlerDefaultLog();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v44 = v13;
                      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found a favorites entry matching handle: %@", buf, 0xCu);
                    }

                    BOOL v25 = 1;
                    v8 = v28;
                    id v6 = v29;
                    goto LABEL_33;
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            v8 = v28;
            id v6 = v29;
          }
          else
          {
            v19 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v13;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring favorite for telephony call with an empty phone number: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v18 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring favorite for telephony call without a phone number: %@", buf, 0xCu);
          }
        }

        uint64_t v11 = v30;
        id v10 = v31;
      }

LABEL_27:
      v12 = (char *)v12 + 1;
    }
    while (v12 != v10);
    id v10 = [v8 countByEnumeratingWithState:&v39 objects:v46 count:16];
  }
  while (v10);
LABEL_29:
  BOOL v25 = 0;
LABEL_33:

  return v25;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);

  objc_storeStrong((id *)&self->_favoritesController, 0);
}

@end