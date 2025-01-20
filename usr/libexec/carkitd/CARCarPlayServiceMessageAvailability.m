@interface CARCarPlayServiceMessageAvailability
+ (unint64_t)identifier;
- (BOOL)wirelessAvailable;
- (CARCarPlayServiceMessageAvailability)initWithDictionaryRepresentation:(id)a3;
- (CARCarPlayServiceMessageAvailability)initWithWirelessAvailable:(BOOL)a3 wiredAvailable:(id)a4 usbIdentifier:(id)a5 themeAssetsAvailable:(id)a6;
- (NSNumber)themeAssetsAvailable;
- (NSNumber)wiredAvailable;
- (NSString)description;
- (NSString)usbIdentifier;
- (id)dictionaryRepresentation;
@end

@implementation CARCarPlayServiceMessageAvailability

- (CARCarPlayServiceMessageAvailability)initWithWirelessAvailable:(BOOL)a3 wiredAvailable:(id)a4 usbIdentifier:(id)a5 themeAssetsAvailable:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CARCarPlayServiceMessageAvailability;
  v14 = [(CARCarPlayServiceMessageAvailability *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_wirelessAvailable = a3;
    objc_storeStrong((id *)&v14->_wiredAvailable, a4);
    objc_storeStrong((id *)&v15->_usbIdentifier, a5);
    objc_storeStrong((id *)&v15->_themeAssetsAvailable, a6);
  }

  return v15;
}

- (NSString)description
{
  v14.receiver = self;
  v14.super_class = (Class)CARCarPlayServiceMessageAvailability;
  v3 = [(CARCarPlayServiceMessageAvailability *)&v14 description];
  if ([(CARCarPlayServiceMessageAvailability *)self wirelessAvailable]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  v5 = [(CARCarPlayServiceMessageAvailability *)self wiredAvailable];
  CFStringRef v6 = @"unset";
  if (v5)
  {
    id v13 = [(CARCarPlayServiceMessageAvailability *)self wiredAvailable];
    if ([v13 BOOLValue]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
  }
  v7 = [(CARCarPlayServiceMessageAvailability *)self usbIdentifier];
  v8 = [(CARCarPlayServiceMessageAvailability *)self themeAssetsAvailable];
  if (v8)
  {
    v9 = [(CARCarPlayServiceMessageAvailability *)self themeAssetsAvailable];
    if ([v9 BOOLValue]) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    id v11 = +[NSString stringWithFormat:@"%@ {wirelessAvailable: %@, wiredAvailable: %@, usbIdentifier: %@, themeAssetsAvailable: %@}", v3, v4, v6, v7, v10];
  }
  else
  {
    id v11 = +[NSString stringWithFormat:@"%@ {wirelessAvailable: %@, wiredAvailable: %@, usbIdentifier: %@, themeAssetsAvailable: %@}", v3, v4, v6, v7, @"unset"];
  }

  if (v5) {

  }
  return (NSString *)v11;
}

+ (unint64_t)identifier
{
  return 2;
}

- (CARCarPlayServiceMessageAvailability)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 objectForKey:@"wireless"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (!v6)
    {
      v8 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100072C04();
      }
      v9 = 0;
      goto LABEL_57;
    }
    objc_opt_class();
    id v7 = [v6 objectForKey:@"available"];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }

    if (!v8)
    {
      id v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100072C78();
      }
      v9 = 0;
      goto LABEL_56;
    }
    objc_opt_class();
    id v10 = [v4 objectForKey:@"wired"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      objc_opt_class();
      id v12 = [v11 objectForKey:@"available"];
      if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }

      if (!v13)
      {
        id v13 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100072C78();
        }
        v9 = 0;
        goto LABEL_55;
      }
      objc_opt_class();
      id v14 = [v11 objectForKey:@"usbIdentifier"];
      if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }

      if (!v15)
      {
        v15 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100072CEC();
        }
        v9 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      id v13 = 0;
      v15 = 0;
    }
    objc_opt_class();
    id v16 = [v4 objectForKey:@"asset"];
    if (v16 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    if (v17)
    {
      objc_opt_class();
      id v18 = [v17 objectForKey:@"available"];
      if (v18 && (objc_opt_isKindOfClass() & 1) != 0) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }

      if (!v19)
      {
        v19 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100072C78();
        }
        v9 = 0;
        goto LABEL_53;
      }
    }
    else
    {
      v19 = 0;
    }
    self = [(CARCarPlayServiceMessageAvailability *)self initWithWirelessAvailable:[v8 BOOLValue] wiredAvailable:v13 usbIdentifier:v15 themeAssetsAvailable:v19];
    v9 = self;
LABEL_53:

LABEL_54:
LABEL_55:

LABEL_56:
LABEL_57:

    goto LABEL_58;
  }
  v9 = 0;
LABEL_58:

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  CFStringRef v14 = @"available";
  id v4 = +[NSNumber numberWithBool:[(CARCarPlayServiceMessageAvailability *)self wirelessAvailable]];
  v15 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v3 setObject:v5 forKey:@"wireless"];

  id v6 = [(CARCarPlayServiceMessageAvailability *)self wiredAvailable];

  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionary];
    v8 = [(CARCarPlayServiceMessageAvailability *)self wiredAvailable];
    [v7 cr_setSafeObject:v8 forKey:@"available"];

    v9 = [(CARCarPlayServiceMessageAvailability *)self usbIdentifier];
    [v7 cr_setSafeObject:v9 forKey:@"usbIdentifier"];

    [v3 setObject:v7 forKey:@"wired"];
  }
  id v10 = [(CARCarPlayServiceMessageAvailability *)self themeAssetsAvailable];

  if (v10)
  {
    id v11 = +[NSMutableDictionary dictionary];
    id v12 = [(CARCarPlayServiceMessageAvailability *)self themeAssetsAvailable];
    [v11 cr_setSafeObject:v12 forKey:@"available"];

    [v3 setObject:v11 forKey:@"asset"];
  }

  return v3;
}

- (BOOL)wirelessAvailable
{
  return self->_wirelessAvailable;
}

- (NSNumber)wiredAvailable
{
  return self->_wiredAvailable;
}

- (NSString)usbIdentifier
{
  return self->_usbIdentifier;
}

- (NSNumber)themeAssetsAvailable
{
  return self->_themeAssetsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeAssetsAvailable, 0);
  objc_storeStrong((id *)&self->_usbIdentifier, 0);

  objc_storeStrong((id *)&self->_wiredAvailable, 0);
}

@end