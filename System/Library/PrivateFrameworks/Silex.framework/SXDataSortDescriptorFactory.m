@interface SXDataSortDescriptorFactory
- (id)sortDescriptorForDataDescriptor:(id)a3 ascending:(BOOL)a4;
@end

@implementation SXDataSortDescriptorFactory

- (id)sortDescriptorForDataDescriptor:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 dataType];
  if ((unint64_t)(v6 - 3) < 3)
  {
    v7 = SXDataNumberSortDescriptor;
LABEL_5:
    id v8 = [v7 alloc];
    v9 = [v5 key];
    v10 = (void *)[v8 initWithKey:v9 ascending:v4];

    goto LABEL_6;
  }
  if ((unint64_t)(v6 - 1) <= 1)
  {
    v7 = SXDataStringSortDescriptor;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

@end