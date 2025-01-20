@interface PLAccountingQualificationEventBackwardEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingQualificationEventBackwardEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withEndDate:(id)a5;
@end

@implementation PLAccountingQualificationEventBackwardEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventBackwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_11 != -1) {
    dispatch_once(&entryKey_onceToken_11, &__block_literal_global_13);
  }
  objc_super v2 = (void *)entryKey_entryKey_11;
  return v2;
}

uint64_t __55__PLAccountingQualificationEventBackwardEntry_entryKey__block_invoke()
{
  entryKey_entryKey_11 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F7F0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingQualificationEventBackwardEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withEndDate:(id)a5
{
  v5 = (PLAccountingQualificationEventBackwardEntry *)a5;
  if (a5)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:v5];
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingQualificationEventBackwardEntry;
    v11 = [(PLAccountingQualificationEventEntry *)&v13 initWithQualificationID:v9 withChildNodeNames:v8 withRange:v10];

    self = v11;
    v5 = self;
  }

  return v5;
}

+ (int)classDirectionality
{
  return 2;
}

@end