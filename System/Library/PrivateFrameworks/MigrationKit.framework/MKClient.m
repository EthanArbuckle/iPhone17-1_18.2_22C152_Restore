@interface MKClient
- (MKClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6 os:(id)a7 version:(id)a8 locale:(id)a9 inputMethodLanguages:(id)a10 activatedCellularPlans:(unint64_t)a11;
- (NSArray)inputMethodLanguages;
- (NSString)brand;
- (NSString)hostname;
- (NSString)locale;
- (NSString)model;
- (NSString)name;
- (NSString)os;
- (NSString)version;
- (unint64_t)activatedCellularPlans;
- (void)setActivatedCellularPlans:(unint64_t)a3;
- (void)setBrand:(id)a3;
- (void)setHostname:(id)a3;
- (void)setInputMethodLanguages:(id)a3;
- (void)setLocale:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOs:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MKClient

- (MKClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6 os:(id)a7 version:(id)a8 locale:(id)a9 inputMethodLanguages:(id)a10 activatedCellularPlans:(unint64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v28.receiver = self;
  v28.super_class = (Class)MKClient;
  v25 = [(MKClient *)&v28 init];
  v26 = v25;
  if (v25)
  {
    [(MKClient *)v25 setHostname:v17];
    [(MKClient *)v26 setBrand:v18];
    [(MKClient *)v26 setModel:v19];
    [(MKClient *)v26 setName:v20];
    [(MKClient *)v26 setOs:v21];
    [(MKClient *)v26 setVersion:v22];
    [(MKClient *)v26 setLocale:v23];
    [(MKClient *)v26 setInputMethodLanguages:v24];
    [(MKClient *)v26 setActivatedCellularPlans:a11];
  }

  return v26;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)os
{
  return self->_os;
}

- (void)setOs:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)inputMethodLanguages
{
  return self->_inputMethodLanguages;
}

- (void)setInputMethodLanguages:(id)a3
{
}

- (unint64_t)activatedCellularPlans
{
  return self->_activatedCellularPlans;
}

- (void)setActivatedCellularPlans:(unint64_t)a3
{
  self->_activatedCellularPlans = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMethodLanguages, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_os, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end