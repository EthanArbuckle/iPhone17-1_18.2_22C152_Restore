@interface PHContactViewController
- (CHHandle)handle;
- (CHRecentCall)recentCall;
- (id)primaryPropertyKey;
- (void)setHandle:(id)a3;
- (void)setRecentCall:(id)a3;
@end

@implementation PHContactViewController

- (id)primaryPropertyKey
{
  v15.receiver = self;
  v15.super_class = (Class)PHContactViewController;
  v3 = [(PHContactViewController *)&v15 primaryPropertyKey];
  v4 = [(PHContactViewController *)self recentCall];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 handleType];
    if ((unint64_t)v6 < 2)
    {
      id v8 = 0;
    }
    else
    {
      if (v6 == (id)2)
      {
        v7 = (id *)&CNContactPhoneNumbersKey;
      }
      else
      {
        if (v6 != (id)3) {
          goto LABEL_10;
        }
        v7 = (id *)&CNContactEmailAddressesKey;
      }
      id v8 = *v7;
    }

    v3 = v8;
  }
LABEL_10:
  v9 = [(PHContactViewController *)self handle];
  v10 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  id v11 = [v9 type];
  if ((unint64_t)v11 < 2)
  {
    id v13 = 0;
  }
  else
  {
    if (v11 == (id)2)
    {
      v12 = (id *)&CNContactPhoneNumbersKey;
    }
    else
    {
      if (v11 != (id)3) {
        goto LABEL_19;
      }
      v12 = (id *)&CNContactEmailAddressesKey;
    }
    id v13 = *v12;
  }

  v3 = v13;
LABEL_19:

  return v3;
}

- (void)setRecentCall:(id)a3
{
  v5 = (CHRecentCall *)a3;
  if (self->_recentCall != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_recentCall, a3);
    id v6 = [(CHRecentCall *)v18 callerId];
    if (![v6 length])
    {
LABEL_13:

      goto LABEL_14;
    }
    id v7 = [(CHRecentCall *)v18 handleType];
    if (v7 == (id)3)
    {
      v12 = [(PHContactViewController *)self contact];
      v9 = [v12 labeledValueForEmailAddress:v6];

      v10 = (id *)&CNContactEmailAddressesKey;
    }
    else
    {
      if (v7 == (id)2)
      {
        objc_super v15 = [(CHRecentCall *)v18 isoCountryCode];
        v16 = +[CNPhoneNumber phoneNumberWithDigits:v6 countryCode:v15];

        if (v16)
        {
          v17 = [(PHContactViewController *)self contact];
          v9 = [v17 labeledValueForPhoneNumber:v16];

          id v11 = CNContactPhoneNumbersKey;
        }
        else
        {
          id v11 = 0;
          v9 = 0;
        }

        if (!v9) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      if (v7 != (id)1 || !v6)
      {
        v9 = 0;
        id v11 = 0;
        goto LABEL_12;
      }
      id v8 = [(PHContactViewController *)self contact];
      v9 = [v8 labeledValueForSocialProfileWithUsername:v6];

      v10 = (id *)&CNContactSocialProfilesKey;
    }
    id v11 = (NSString *)*v10;
    if (v9)
    {
LABEL_11:
      id v13 = [v9 identifier];
      unsigned int v14 = [(CHRecentCall *)v18 callStatus];
      [(PHContactViewController *)self highlightPropertyWithKey:v11 identifier:v13 important:v14 == kCHCallStatusMissed];
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

  _objc_release_x1();
}

- (void)setHandle:(id)a3
{
  v5 = (CHHandle *)a3;
  if (self->_handle != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_handle, a3);
    id v6 = [(CHHandle *)v17 type];
    if (v6 == (id)3)
    {
      id v11 = [(PHContactViewController *)self contact];
      v12 = [(CHHandle *)v17 value];
      v9 = [v11 labeledValueForEmailAddress:v12];

      id v13 = CNContactEmailAddressesKey;
      if (!v9) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (v6 == (id)2)
    {
      unsigned int v14 = [(CHHandle *)v17 value];
      id v7 = +[CNPhoneNumber phoneNumberWithStringValue:v14];

      if (v7)
      {
        objc_super v15 = [(PHContactViewController *)self contact];
        v9 = [v15 labeledValueForPhoneNumber:v7];

        v10 = (id *)&CNContactPhoneNumbersKey;
        goto LABEL_11;
      }
    }
    else
    {
      if (v6 != (id)1)
      {
        v9 = 0;
        id v13 = 0;
        goto LABEL_16;
      }
      id v7 = [(CHHandle *)v17 value];
      if (v7)
      {
        id v8 = [(PHContactViewController *)self contact];
        v9 = [v8 labeledValueForSocialProfileWithUsername:v7];

        v10 = (id *)&CNContactSocialProfilesKey;
LABEL_11:
        id v13 = (NSString *)*v10;
        goto LABEL_14;
      }
    }
    id v13 = 0;
    v9 = 0;
LABEL_14:

    if (v9)
    {
LABEL_15:
      v16 = [v9 identifier];
      [(PHContactViewController *)self highlightPropertyWithKey:v13 identifier:v16 important:0];
    }
LABEL_16:
  }

  _objc_release_x1();
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (CHHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end