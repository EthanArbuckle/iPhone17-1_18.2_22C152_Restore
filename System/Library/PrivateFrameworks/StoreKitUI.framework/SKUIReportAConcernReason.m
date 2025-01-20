@interface SKUIReportAConcernReason
- (NSNumber)reasonID;
- (NSString)name;
- (NSString)uppercaseName;
- (void)setName:(id)a3;
- (void)setReasonID:(id)a3;
- (void)setUppercaseName:(id)a3;
@end

@implementation SKUIReportAConcernReason

- (NSNumber)reasonID
{
  return self->_reasonID;
}

- (void)setReasonID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)uppercaseName
{
  return self->_uppercaseName;
}

- (void)setUppercaseName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppercaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_reasonID, 0);
}

@end