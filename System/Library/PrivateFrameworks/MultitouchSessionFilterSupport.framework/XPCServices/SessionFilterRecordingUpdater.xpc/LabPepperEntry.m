@interface LabPepperEntry
- (LabPepperEntry)initWithLPDataSource:(unsigned __int16)a3 data:(id)a4;
- (NSData)data;
- (unsigned)dataSource;
@end

@implementation LabPepperEntry

- (LabPepperEntry)initWithLPDataSource:(unsigned __int16)a3 data:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LabPepperEntry;
  v7 = [(LabPepperEntry *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_dataSource = a3;
    v9 = (NSData *)[v6 copy];
    data = v8->_data;
    v8->_data = v9;

    v11 = v8;
  }

  return v8;
}

- (unsigned)dataSource
{
  return self->_dataSource;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end