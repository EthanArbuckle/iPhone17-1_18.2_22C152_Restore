@interface MFSearchTokenTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MFSearchTokenTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  v3 = [a3 representedObject];
  v4 = [v3 csToken];
  id v10 = 0;
  v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (![v5 length])
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v6 ef_publicDescription];
      sub_10045D468(v8, buf, v7);
    }
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_8;
  }
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:0];
  id v14 = 0;
  v5 = [v4 decodeTopLevelObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey error:&v14];
  id v6 = v14;
  id v7 = [objc_alloc((Class)MUISuggestionToken) initWithCSToken:v5];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 image];
    id v10 = [v8 title];
    v11 = +[UISearchToken tokenWithIcon:v9 text:v10];

    [v11 setRepresentedObject:v8];
  }
  else
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v6 ef_publicDescription];
      sub_10045D4C0(v12, buf, v11);
    }
  }
  if (!v8) {
LABEL_8:
  }
    v11 = 0;

  return v11;
}

@end