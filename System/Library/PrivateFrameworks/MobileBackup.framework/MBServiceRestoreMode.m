@interface MBServiceRestoreMode
+ (MBServiceRestoreMode)restoreModeWithType:(int)a3 value:(id)a4;
+ (id)backgroundAppGroupRestoreModeWithBundleID:(id)a3;
+ (id)backgroundAppPluginRestoreModeWithBundleID:(id)a3;
+ (id)backgroundAppRestoreModeWithBundleID:(id)a3;
+ (id)backgroundAppRestoreModeWithBundleID:(id)a3 errorCode:(int)a4;
+ (id)backgroundContainerRestoreModeWithContainer:(id)a3;
+ (id)backgroundDataSeparatedAppRestoreModeWithBundleID:(id)a3;
+ (id)backgroundFileRestoreModeWithPath:(id)a3;
+ (id)backgroundFilesRestoreModeWithPaths:(id)a3;
+ (id)foregroundDataSeparatedRestoreMode;
+ (id)foregroundRestoreMode;
+ (id)stringForErrorCode:(int)a3;
+ (id)stringForType:(int)a3;
+ (int)restoreTypeForContainerType:(int)a3;
- (BOOL)didFail;
- (BOOL)isBackgroundApp;
- (BOOL)isBackgroundFile;
- (BOOL)isBackgroundFiles;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)wasCancelled;
- (NSArray)paths;
- (NSArray)values;
- (NSString)bundleID;
- (NSString)errorString;
- (NSString)path;
- (NSString)value;
- (id)_initWithType:(int)a3 value:(id)a4 errorCode:(int)a5;
- (id)_initWithType:(int)a3 values:(id)a4 errorCode:(int)a5;
- (id)_typeString;
- (id)description;
- (int)type;
@end

@implementation MBServiceRestoreMode

+ (int)restoreTypeForContainerType:(int)a3
{
  int result = 1;
  switch(a3)
  {
    case 0:
    case 4:
    case 5:
      +[NSException raise:NSInvalidArgumentException, @"Unexpected container type: %d", *(void *)&a3 format];
      int result = 0;
      break;
    case 2:
    case 3:
      int result = a3;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)foregroundRestoreMode
{
  id v2 = [[MBServiceRestoreMode alloc] _initWithType:0 value:0 errorCode:0];
  return v2;
}

+ (id)foregroundDataSeparatedRestoreMode
{
  id v2 = [[MBServiceRestoreMode alloc] _initWithType:6 value:0 errorCode:0];
  return v2;
}

+ (id)backgroundAppRestoreModeWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:1 value:v3 errorCode:0];

  return v4;
}

+ (id)backgroundDataSeparatedAppRestoreModeWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:7 value:v3 errorCode:0];

  return v4;
}

+ (id)backgroundAppRestoreModeWithBundleID:(id)a3 errorCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[MBServiceRestoreMode alloc] _initWithType:1 value:v5 errorCode:v4];

  return v6;
}

+ (id)backgroundAppPluginRestoreModeWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:2 value:v3 errorCode:0];

  return v4;
}

+ (id)backgroundAppGroupRestoreModeWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:3 value:v3 errorCode:0];

  return v4;
}

+ (id)backgroundContainerRestoreModeWithContainer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MBServiceRestoreMode restoreTypeForContainerType:](MBServiceRestoreMode, "restoreTypeForContainerType:", [v3 containerType]);
  id v5 = [MBServiceRestoreMode alloc];
  id v6 = [v3 identifier];

  id v7 = [(MBServiceRestoreMode *)v5 _initWithType:v4 value:v6 errorCode:0];
  return v7;
}

+ (id)backgroundFileRestoreModeWithPath:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:4 value:v3 errorCode:0];

  return v4;
}

+ (id)backgroundFilesRestoreModeWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = [[MBServiceRestoreMode alloc] _initWithType:5 values:v3 errorCode:0];

  return v4;
}

+ (MBServiceRestoreMode)restoreModeWithType:(int)a3 value:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [[MBServiceRestoreMode alloc] _initWithType:v4 value:v5 errorCode:0];

  return (MBServiceRestoreMode *)v6;
}

+ (id)stringForType:(int)a3
{
  if ((a3 - 1) > 6) {
    return @"foreground restore";
  }
  else {
    return *(&off_100416D98 + a3 - 1);
  }
}

+ (id)stringForErrorCode:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_100416DD0 + a3);
  }
}

- (id)_initWithType:(int)a3 value:(id)a4 errorCode:(int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBServiceRestoreMode;
  v10 = [(MBServiceRestoreMode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_value, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (id)_initWithType:(int)a3 values:(id)a4 errorCode:(int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBServiceRestoreMode;
  v10 = [(MBServiceRestoreMode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_values, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (id)_typeString
{
  uint64_t v2 = [(MBServiceRestoreMode *)self type];
  return +[MBServiceRestoreMode stringForType:v2];
}

- (NSString)errorString
{
  return (NSString *)+[MBServiceRestoreMode stringForErrorCode:self->_errorCode];
}

- (BOOL)isForeground
{
  int type = self->_type;
  return !type || type == 6;
}

- (BOOL)isBackgroundApp
{
  int type = self->_type;
  return type == 1 || type == 7;
}

- (BOOL)isBackgroundFile
{
  return self->_type == 4;
}

- (BOOL)isBackgroundFiles
{
  return self->_type == 5;
}

- (NSString)bundleID
{
  if (![(MBServiceRestoreMode *)self isBackgroundApp])
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreMode.m" lineNumber:142 description:@"Not background app restore"];
  }
  value = self->_value;
  return value;
}

- (NSString)path
{
  if (![(MBServiceRestoreMode *)self isBackgroundFile])
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreMode.m" lineNumber:147 description:@"Not background file restore"];
  }
  value = self->_value;
  return value;
}

- (NSArray)paths
{
  if (![(MBServiceRestoreMode *)self isBackgroundFiles])
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreMode.m" lineNumber:152 description:@"Not background files restore"];
  }
  values = self->_values;
  return values;
}

- (BOOL)didFail
{
  if (![(MBServiceRestoreMode *)self isBackgroundApp])
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreMode.m" lineNumber:157 description:@"Not background app restore"];
  }
  return self->_errorCode == 1;
}

- (BOOL)wasCancelled
{
  if (![(MBServiceRestoreMode *)self isBackgroundApp])
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MBServiceRestoreMode.m" lineNumber:162 description:@"Not background app restore"];
  }
  return self->_errorCode == 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unsigned int v5 = [v4 type], v5 == -[MBServiceRestoreMode type](self, "type")))
  {
    id v6 = [v4 value];
    id v7 = [(MBServiceRestoreMode *)self value];
    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MBServiceRestoreMode *)self _typeString];
  unsigned int v5 = +[NSString stringWithFormat:@"<%@: type='%@', value=\"%@\", values=\"%@\", errorCode=%d>", v3, v4, self->_value, self->_values, self->_errorCode];

  return v5;
}

- (int)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end