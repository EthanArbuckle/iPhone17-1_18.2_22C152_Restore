@interface PLAccountingQualificationEventIntervalEntry
+ (id)entryKey;
+ (int)classDirectionality;
+ (void)load;
- (PLAccountingQualificationEventIntervalEntry)initWithQualificationID:(id)a3 withChildNodeIDs:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (PLAccountingQualificationEventIntervalEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
@end

@implementation PLAccountingQualificationEventIntervalEntry

+ (int)classDirectionality
{
  return 3;
}

+ (id)entryKey
{
  if (entryKey_onceToken_6 != -1) {
    dispatch_once(&entryKey_onceToken_6, &__block_literal_global_8);
  }
  v2 = (void *)entryKey_entryKey_6;
  return v2;
}

- (PLAccountingQualificationEventIntervalEntry)initWithQualificationID:(id)a3 withChildNodeIDs:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  v7 = 0;
  if (a5 && a6)
  {
    id v11 = a4;
    id v12 = a3;
    v13 = +[PLAccountingRange rangeWithStartDate:a5 withEndDate:a6];
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingQualificationEventIntervalEntry;
    v14 = [(PLAccountingQualificationEventEntry *)&v16 initWithQualificationID:v12 withChildNodeIDs:v11 withRange:v13];

    self = v14;
    v7 = self;
  }

  return v7;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventIntervalEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __55__PLAccountingQualificationEventIntervalEntry_entryKey__block_invoke()
{
  entryKey_entryKey_6 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5F7F0]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingQualificationEventIntervalEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  v7 = 0;
  if (a5 && a6)
  {
    id v11 = a4;
    id v12 = a3;
    v13 = +[PLAccountingRange rangeWithStartDate:a5 withEndDate:a6];
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingQualificationEventIntervalEntry;
    v14 = [(PLAccountingQualificationEventEntry *)&v16 initWithQualificationID:v12 withChildNodeNames:v11 withRange:v13];

    self = v14;
    v7 = self;
  }

  return v7;
}

@end