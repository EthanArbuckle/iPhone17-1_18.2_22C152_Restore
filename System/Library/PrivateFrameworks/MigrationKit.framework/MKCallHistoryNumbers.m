@interface MKCallHistoryNumbers
- (MKCallHistoryNumbers)initWithSerializedData:(id)a3;
- (NSArray)numbersInUse;
- (void)setNumbersInUse:(id)a3;
@end

@implementation MKCallHistoryNumbers

- (MKCallHistoryNumbers)initWithSerializedData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKCallHistoryNumbers;
  v5 = [(MKCallHistoryNumbers *)&v9 init];
  if (v5)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v4, "mk_arrayForKey:", @"numbers_in_use");
    [(MKCallHistoryNumbers *)v5 setNumbersInUse:v6];
  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (NSArray)numbersInUse
{
  return self->_numbersInUse;
}

- (void)setNumbersInUse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end