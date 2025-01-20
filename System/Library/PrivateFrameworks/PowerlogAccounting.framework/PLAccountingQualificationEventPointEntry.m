@interface PLAccountingQualificationEventPointEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingQualificationEventPointEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5;
@end

@implementation PLAccountingQualificationEventPointEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventPointEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_2 != -1) {
    dispatch_once(&entryKey_onceToken_2, &__block_literal_global_4);
  }
  objc_super v2 = (void *)entryKey_entryKey_2;
  return v2;
}

uint64_t __52__PLAccountingQualificationEventPointEntry_entryKey__block_invoke()
{
  entryKey_entryKey_2 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F7F0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingQualificationEventPointEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  v5 = (PLAccountingQualificationEventPointEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:v5 withEndDate:v5];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingQualificationEventPointEntry;
    v11 = [(PLAccountingQualificationEventEntry *)&v13 initWithQualificationID:v9 withChildNodeNames:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

+ (int)classDirectionality
{
  return 4;
}

@end