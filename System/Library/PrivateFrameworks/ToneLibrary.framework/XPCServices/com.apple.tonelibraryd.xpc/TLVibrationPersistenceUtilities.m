@interface TLVibrationPersistenceUtilities
+ (BOOL)_objectIsValidUserGeneratedVibrationPattern:(id)a3 error:(id *)a4;
+ (BOOL)_validateObjectWithError:(id *)a3 validationBlock:(id)a4;
+ (BOOL)objectIsValidUserGeneratedVibrationPatternsDictionary:(id)a3 error:(id *)a4;
+ (NSURL)userGeneratedVibrationStoreFileURL;
@end

@implementation TLVibrationPersistenceUtilities

+ (BOOL)_validateObjectWithError:(id *)a3 validationBlock:(id)a4
{
  id v14 = 0;
  id v15 = 0;
  id v13 = 0;
  (*((void (**)(id, id *, id *, id *))a4 + 2))(a4, &v15, &v14, &v13);
  id v5 = v15;
  unint64_t v6 = (unint64_t)v14;
  unint64_t v7 = (unint64_t)v13;
  v8 = (void *)v7;
  if (!v5)
  {
    if (!(v6 | v7))
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    if (a3)
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *a3 = +[NSError tl_errorWithDomain:@"TLServiceValidationErrorDomain", @"Unexpected type for %@: %@ (%@)", v8, v11, v6 description];
    }
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 0;
  *a3 = v5;
LABEL_9:

  return v9;
}

+ (BOOL)_objectIsValidUserGeneratedVibrationPattern:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002EAC;
  v8[3] = &unk_100008270;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = [a1 _validateObjectWithError:a4 validationBlock:v8];

  return (char)a4;
}

+ (BOOL)objectIsValidUserGeneratedVibrationPatternsDictionary:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000032D4;
  v8[3] = &unk_100008298;
  id v9 = a3;
  id v10 = a1;
  id v6 = v9;
  LOBYTE(a4) = [a1 _validateObjectWithError:a4 validationBlock:v8];

  return (char)a4;
}

+ (NSURL)userGeneratedVibrationStoreFileURL
{
  v2 = CPSharedResourcesDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Media/Vibrations/UserGeneratedVibrationPatterns.plist"];
  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

@end