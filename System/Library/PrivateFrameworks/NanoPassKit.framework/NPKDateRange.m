@interface NPKDateRange
+ (id)_dateStringWithDate:(id)a3 style:(unint64_t)a4;
- (NPKDateRange)initWithStartDate:(id)a3 expirationDate:(id)a4 formatterStyle:(unint64_t)a5;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSString)expiryDateString;
- (NSString)startDateString;
@end

@implementation NPKDateRange

- (NPKDateRange)initWithStartDate:(id)a3 expirationDate:(id)a4 formatterStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKDateRange;
  v11 = [(NPKDateRange *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    uint64_t v13 = [(id)objc_opt_class() _dateStringWithDate:v9 style:a5];
    startDateString = v12->_startDateString;
    v12->_startDateString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_expiryDate, a4);
    uint64_t v15 = [(id)objc_opt_class() _dateStringWithDate:v12->_expiryDate style:a5];
    expiryDateString = v12->_expiryDateString;
    v12->_expiryDateString = (NSString *)v15;
  }
  return v12;
}

+ (id)_dateStringWithDate:(id)a3 style:(unint64_t)a4
{
  if (a3)
  {
    v5 = [MEMORY[0x263F08790] localizedStringFromDate:a3 dateStyle:a4 timeStyle:0];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)startDateString
{
  return self->_startDateString;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSString)expiryDateString
{
  return self->_expiryDateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDateString, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDateString, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end