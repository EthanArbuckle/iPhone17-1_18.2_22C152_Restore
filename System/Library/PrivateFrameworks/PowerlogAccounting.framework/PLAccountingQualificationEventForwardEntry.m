@interface PLAccountingQualificationEventForwardEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingQualificationEventForwardEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5;
@end

@implementation PLAccountingQualificationEventForwardEntry

+ (int)classDirectionality
{
  return 1;
}

+ (id)entryKey
{
  if (entryKey_onceToken_9 != -1) {
    dispatch_once(&entryKey_onceToken_9, &__block_literal_global_11);
  }
  v2 = (void *)entryKey_entryKey_9;
  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __54__PLAccountingQualificationEventForwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_9 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F7F0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingQualificationEventForwardEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  v5 = (PLAccountingQualificationEventForwardEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:v5 withEndDate:0];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingQualificationEventForwardEntry;
    v11 = [(PLAccountingQualificationEventEntry *)&v13 initWithQualificationID:v9 withChildNodeNames:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

@end