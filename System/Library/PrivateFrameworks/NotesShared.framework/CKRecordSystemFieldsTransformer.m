@interface CKRecordSystemFieldsTransformer
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation CKRecordSystemFieldsTransformer

+ (Class)transformedValueClass
{
  getCKRecordClass();
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F28DB0];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
    [v4 encodeSystemFieldsWithCoder:v5];

    v6 = [v5 encodedData];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    id v10 = 0;
    v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v10];

    id v6 = v10;
    if (v6)
    {
      v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:]((uint64_t)v6, v7);
      }
    }
    v8 = (void *)[objc_alloc((Class)getCKRecordClass()) initWithCoder:v5];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end