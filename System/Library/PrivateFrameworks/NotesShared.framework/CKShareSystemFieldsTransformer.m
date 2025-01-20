@interface CKShareSystemFieldsTransformer
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
@end

@implementation CKShareSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
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
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A390]) initWithCoder:v5];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end