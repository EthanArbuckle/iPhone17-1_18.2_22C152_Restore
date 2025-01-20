@interface ICQInternetPrivacyBannerModel
- (BOOL)isEqual:(id)a3;
- (ICQInternetPrivacyBannerModel)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 status:(unint64_t)a6 networkName:(id)a7;
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)networkName;
- (NSString)title;
- (unint64_t)status;
- (void)setButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQInternetPrivacyBannerModel

- (ICQInternetPrivacyBannerModel)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 status:(unint64_t)a6 networkName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ICQInternetPrivacyBannerModel;
  v17 = [(ICQInternetPrivacyBannerModel *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_buttonTitle, a5);
    v18->_status = a6;
    objc_storeStrong((id *)&v18->_networkName, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ICQInternetPrivacyBannerModel *)self buttonTitle];

    if (v6)
    {
      v7 = [(ICQInternetPrivacyBannerModel *)self buttonTitle];
      v8 = [v5 buttonTitle];
      int v9 = [v7 isEqualToString:v8];
    }
    else
    {
      v7 = [v5 buttonTitle];
      int v9 = v7 == 0;
    }

    v11 = [(ICQInternetPrivacyBannerModel *)self networkName];

    if (v11)
    {
      v12 = [(ICQInternetPrivacyBannerModel *)self networkName];
      id v13 = [v5 networkName];
      int v14 = [v12 isEqual:v13];
    }
    else
    {
      v12 = [v5 networkName];
      int v14 = v12 == 0;
    }

    if ((v9 & v14) == 1)
    {
      id v15 = [(ICQInternetPrivacyBannerModel *)self title];
      id v16 = [v5 title];
      if ([v15 isEqualToString:v16])
      {
        v17 = [(ICQInternetPrivacyBannerModel *)self message];
        v18 = [v5 message];
        if ([v17 isEqualToString:v18])
        {
          unint64_t v19 = [(ICQInternetPrivacyBannerModel *)self status];
          BOOL v10 = v19 == [v5 status];
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end