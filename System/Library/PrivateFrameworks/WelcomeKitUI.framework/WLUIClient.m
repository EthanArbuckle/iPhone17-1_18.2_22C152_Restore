@interface WLUIClient
- (NSString)brand;
- (NSString)hostname;
- (NSString)model;
- (NSString)name;
- (WLUIClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6;
- (void)setBrand:(id)a3;
- (void)setHostname:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
@end

@implementation WLUIClient

- (WLUIClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WLUIClient;
  v14 = [(WLUIClient *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(WLUIClient *)v14 setHostname:v10];
    [(WLUIClient *)v15 setBrand:v11];
    [(WLUIClient *)v15 setModel:v12];
    [(WLUIClient *)v15 setName:v13];
  }

  return v15;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end