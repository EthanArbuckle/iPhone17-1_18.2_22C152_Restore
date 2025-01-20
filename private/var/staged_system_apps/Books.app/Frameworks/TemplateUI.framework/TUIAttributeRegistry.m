@interface TUIAttributeRegistry
+ (id)nameForAttribute:(unsigned __int16)a3;
+ (unsigned)attributeWithName:(id)a3;
+ (unsigned)lookupAttributeWithName:(id)a3;
+ (unsigned)registerCustomAttributeWithName:(id)a3;
@end

@implementation TUIAttributeRegistry

+ (unsigned)registerCustomAttributeWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = sub_84E24();
    v6 = [v5 objectForKeyedSubscript:v4];
    v7 = v6;
    if (v6)
    {
      unsigned __int16 v8 = (unsigned __int16)[v6 integerValue];
    }
    else
    {
      if (qword_2DF4F0 != -1) {
        dispatch_once(&qword_2DF4F0, &stru_2541D0);
      }
      uint64_t v9 = qword_2DF4E8;
      unsigned __int16 v13 = (unsigned __int16)[v5 count];
      v10 = +[NSNumber numberWithUnsignedShort:v13];
      [v5 setObject:v10 forKeyedSubscript:v4];

      v14 = &v13;
      v11 = (id *)sub_12BA4(v9, &v13, (uint64_t)&std::piecewise_construct, &v14);
      objc_storeStrong(v11 + 3, a3);
      unsigned __int16 v8 = v13;
    }
  }
  else
  {
    unsigned __int16 v8 = -1;
  }

  return v8;
}

+ (unsigned)attributeWithName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 lookupAttributeWithName:v4];
  if (v5 == 0xFFFF)
  {
    id v7 = objc_alloc((Class)NSException);
    unsigned __int16 v8 = +[NSString stringWithFormat:@"'%@' not defined/registered", v4];
    id v9 = [v7 initWithName:@"InvalidAttribute" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }

  return v5;
}

+ (id)nameForAttribute:(unsigned __int16)a3
{
  unsigned __int16 v10 = a3;
  if (qword_2DF4F0 != -1) {
    dispatch_once(&qword_2DF4F0, &stru_2541D0);
  }
  v3 = sub_12E50((void *)qword_2DF4E8, &v10);
  if (!v3)
  {
    id v6 = objc_alloc((Class)NSException);
    id v7 = +[NSNumber numberWithUnsignedShort:v10];
    unsigned __int16 v8 = +[NSString stringWithFormat:@"'%@' not defined/registered", v7];
    id v9 = [v6 initWithName:@"InvalidAttribute" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  id v4 = v3[3];

  return v4;
}

+ (unsigned)lookupAttributeWithName:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_84E24();
    unsigned int v5 = [v4 objectForKeyedSubscript:v3];
    id v6 = v5;
    if (v5) {
      unsigned __int16 v7 = (unsigned __int16)[v5 integerValue];
    }
    else {
      unsigned __int16 v7 = -1;
    }
  }
  else
  {
    unsigned __int16 v7 = -1;
  }

  return v7;
}

@end