@interface ASDGeoCodingKeyedUnarchiver
- (id)allowedClasses;
@end

@implementation ASDGeoCodingKeyedUnarchiver

- (id)allowedClasses
{
  Class Class = objc_getClass("ASGeoCodeResult");
  if (!Class)
  {
    v3 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C398(v3);
    }
  }
  v15 = self;
  v16[0] = v15;
  v4 = self;
  v16[1] = v4;
  v5 = self;
  v16[2] = v5;
  v6 = self;
  v16[3] = v6;
  v7 = self;
  v16[4] = v7;
  v8 = self;
  v16[5] = v8;
  v9 = self;
  v16[6] = v9;
  v10 = self;
  v16[7] = v10;
  v16[8] = Class;
  v11 = self;
  v16[9] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:10];
  v13 = +[NSSet setWithArray:v12];

  return v13;
}

@end