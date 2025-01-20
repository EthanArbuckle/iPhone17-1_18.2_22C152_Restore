@interface TransitPayModelData
- (BOOL)canPresentEducationScreen;
- (BOOL)hasAllNeededText;
- (BOOL)isForRemoteDevice;
- (NSArray)educationScreenAssetURLs;
- (NSArray)paymentMethods;
- (NSString)actionTitle;
- (NSString)educationScreenText;
- (NSString)educationScreenTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)topUpPassUniqueID;
- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 paymentMethod:(id)a7 topUpPassUniqueID:(id)a8 isForRemoteDevice:(BOOL)a9;
- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8;
- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8 educationScreenTitle:(id)a9 educationScreenAssetURLs:(id)a10 educationScreenText:(id)a11 topUpPassUniqueID:(id)a12 isForRemoteDevice:(BOOL)a13;
- (UIImage)image;
- (id)analyticsValue;
- (id)description;
- (int)suggestionType;
@end

@implementation TransitPayModelData

- (id)analyticsValue
{
  switch([(TransitPayModelData *)self suggestionType])
  {
    case 1:
      id result = @"OPEN_LOOP_EXPRESS";
      break;
    case 2:
      id result = @"OPEN_LOOP";
      break;
    case 3:
      v4 = [(TransitPayModelData *)self paymentMethods];
      id v5 = [v4 count];

      if ((unint64_t)v5 <= 1)
      {
        v6 = [(TransitPayModelData *)self paymentMethods];
        id v7 = [v6 count];

        if (v7 == (id)1) {
          id result = @"CLOSED_LOOP_PROVISION_SINGLE";
        }
        else {
          id result = 0;
        }
      }
      else
      {
        id result = @"CLOSED_LOOP_PROVISION_MULTIPLE";
      }
      break;
    case 4:
      id result = @"INTEROPERABLE";
      break;
    case 5:
      if ([(TransitPayModelData *)self isForRemoteDevice]) {
        id result = @"CLOSED_LOOP_TOP_UP_WATCH";
      }
      else {
        id result = @"CLOSED_LOOP_TOP_UP_PHONE";
      }
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8 educationScreenTitle:(id)a9 educationScreenAssetURLs:(id)a10 educationScreenText:(id)a11 topUpPassUniqueID:(id)a12 isForRemoteDevice:(BOOL)a13
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v24 = a11;
  id v19 = a12;
  v32.receiver = self;
  v32.super_class = (Class)TransitPayModelData;
  v20 = [(TransitPayModelData *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_title, a3);
    objc_storeStrong((id *)&v21->_subtitle, a4);
    objc_storeStrong((id *)&v21->_actionTitle, a5);
    objc_storeStrong((id *)&v21->_image, a6);
    v21->_suggestionType = a7;
    objc_storeStrong((id *)&v21->_paymentMethods, a8);
    objc_storeStrong((id *)&v21->_educationScreenTitle, a9);
    objc_storeStrong((id *)&v21->_educationScreenAssetURLs, a10);
    objc_storeStrong((id *)&v21->_educationScreenText, a11);
    objc_storeStrong((id *)&v21->_topUpPassUniqueID, a12);
    v21->_isForRemoteDevice = a13;
  }

  return v21;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOBYTE(v21) = 0;
  id v19 = [[TransitPayModelData alloc] initWithTitle:v18 subtitle:v17 actionTitle:v16 image:v15 suggestionType:v8 paymentMethods:v14 educationScreenTitle:0 educationScreenAssetURLs:0 educationScreenText:0 topUpPassUniqueID:0 isForRemoteDevice:v21];

  return v19;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 paymentMethod:(id)a7 topUpPassUniqueID:(id)a8 isForRemoteDevice:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [TransitPayModelData alloc];
  id v26 = v16;
  v22 = +[NSArray arrayWithObjects:&v26 count:1];

  LOBYTE(v25) = a9;
  v23 = [(TransitPayModelData *)v21 initWithTitle:v20 subtitle:v19 actionTitle:v18 image:v17 suggestionType:5 paymentMethods:v22 educationScreenTitle:0 educationScreenAssetURLs:0 educationScreenText:0 topUpPassUniqueID:v15 isForRemoteDevice:v25];

  return v23;
}

- (BOOL)canPresentEducationScreen
{
  v3 = [(TransitPayModelData *)self educationScreenText];
  if ([v3 length])
  {
    v4 = [(TransitPayModelData *)self educationScreenTitle];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasAllNeededText
{
  v3 = [(TransitPayModelData *)self title];
  if ([v3 length])
  {
    v4 = [(TransitPayModelData *)self subtitle];
    if ([v4 length])
    {
      BOOL v5 = [(TransitPayModelData *)self actionTitle];
      BOOL v6 = [v5 length] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@" TransitPayModelData:\n"];
  v4 = [(TransitPayModelData *)self title];
  [v3 appendFormat:@" title:              '%@'\n", v4];

  BOOL v5 = [(TransitPayModelData *)self subtitle];
  [v3 appendFormat:@" subtitle:           '%@'\n", v5];

  BOOL v6 = [(TransitPayModelData *)self actionTitle];
  [v3 appendFormat:@" actionTitle:        '%@'\n", v6];

  id v7 = [(TransitPayModelData *)self image];
  uint64_t v8 = [(TransitPayModelData *)self image];
  [v8 size];
  v9 = NSStringFromCGSize(v22);
  [v3 appendFormat:@" image:              '%x, size:%@'\n", v7, v9];

  unsigned int v10 = [(TransitPayModelData *)self suggestionType] - 1;
  if (v10 > 4) {
    CFStringRef v11 = @"Unknown";
  }
  else {
    CFStringRef v11 = *(&off_1012EEAA8 + (int)v10);
  }
  [v3 appendFormat:@" suggestionType:     '%@'\n", v11];
  v12 = [(TransitPayModelData *)self paymentMethods];
  [v3 appendFormat:@" paymentMethods:     '%@'\n", v12];

  v13 = [(TransitPayModelData *)self educationScreenTitle];
  [v3 appendFormat:@" eduScreenTitle:     '%@'\n", v13];

  id v14 = [(TransitPayModelData *)self educationScreenAssetURLs];
  [v3 appendFormat:@" imageURLs:          '%@'\n", v14];

  id v15 = [(TransitPayModelData *)self educationScreenText];
  [v3 appendFormat:@" eduScreenText:      '%@'\n", v15];

  id v16 = [(TransitPayModelData *)self topUpPassUniqueID];
  [v3 appendFormat:@" topUpUniqueID:      '%@'\n", v16];

  unsigned int v17 = [(TransitPayModelData *)self isForRemoteDevice];
  CFStringRef v18 = @"NO";
  if (v17) {
    CFStringRef v18 = @"YES";
  }
  [v3 appendFormat:@" isForRemoteDevice:  '%@'\n", v18];
  id v19 = [objc_alloc((Class)NSString) initWithString:v3];

  return v19;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (NSString)educationScreenTitle
{
  return self->_educationScreenTitle;
}

- (NSArray)educationScreenAssetURLs
{
  return self->_educationScreenAssetURLs;
}

- (NSString)educationScreenText
{
  return self->_educationScreenText;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSString)topUpPassUniqueID
{
  return self->_topUpPassUniqueID;
}

- (BOOL)isForRemoteDevice
{
  return self->_isForRemoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topUpPassUniqueID, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_educationScreenText, 0);
  objc_storeStrong((id *)&self->_educationScreenAssetURLs, 0);
  objc_storeStrong((id *)&self->_educationScreenTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end