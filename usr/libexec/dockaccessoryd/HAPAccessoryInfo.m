@interface HAPAccessoryInfo
- (BOOL)authenticated;
- (BOOL)isCertified;
- (BOOL)isDenylisted;
- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9;
- (NSNumber)category;
- (NSString)certificationStatus;
- (NSString)denylisted;
- (NSString)manufacturer;
- (NSString)modelName;
- (NSString)name;
- (NSString)ppid;
- (id)description;
@end

@implementation HAPAccessoryInfo

- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9
{
  v15 = (__CFString *)a3;
  id v16 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v17 = a9;
  if (!v15)
  {
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_100083FD0(0);
      v19 = id v23 = v16;
      *(_DWORD *)buf = 138543362;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory name is Unknown", buf, 0xCu);

      id v16 = v23;
    }

    v15 = @"Unknown";
  }
  v28.receiver = self;
  v28.super_class = (Class)HAPAccessoryInfo;
  v20 = [(HAPAccessoryInfo *)&v28 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, v15);
    objc_storeStrong((id *)&v21->_manufacturer, a4);
    objc_storeStrong((id *)&v21->_modelName, a5);
    objc_storeStrong((id *)&v21->_category, a6);
    objc_storeStrong((id *)&v21->_certificationStatus, a7);
    objc_storeStrong((id *)&v21->_denylisted, a8);
    objc_storeStrong((id *)&v21->_ppid, a9);
    v21->_authenticated = 0;
  }

  return v21;
}

- (BOOL)isCertified
{
  v2 = [(HAPAccessoryInfo *)self certificationStatus];
  v3 = [v2 uppercaseString];
  unsigned __int8 v4 = [@"CERTIFIED" isEqualToString:v3];

  return v4;
}

- (BOOL)isDenylisted
{
  v2 = [(HAPAccessoryInfo *)self denylisted];
  v3 = [v2 uppercaseString];
  unsigned __int8 v4 = [@"YES" isEqualToString:v3];

  return v4;
}

- (id)description
{
  v3 = [(HAPAccessoryInfo *)self name];
  unsigned __int8 v4 = [(HAPAccessoryInfo *)self manufacturer];
  v5 = [(HAPAccessoryInfo *)self modelName];
  v6 = [(HAPAccessoryInfo *)self category];
  v7 = [(HAPAccessoryInfo *)self certificationStatus];
  v8 = [(HAPAccessoryInfo *)self denylisted];
  v9 = [(HAPAccessoryInfo *)self ppid];
  v10 = +[NSString stringWithFormat:@"Name: %@, Manufacturer: %@, Model: %@, Category: %@, Certification Status: %@, denylisted: %@, ppid: %@", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSString)certificationStatus
{
  return self->_certificationStatus;
}

- (NSString)denylisted
{
  return self->_denylisted;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_denylisted, 0);
  objc_storeStrong((id *)&self->_certificationStatus, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end