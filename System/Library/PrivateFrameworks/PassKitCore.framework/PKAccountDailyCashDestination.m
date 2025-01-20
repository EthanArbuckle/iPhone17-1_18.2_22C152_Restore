@interface PKAccountDailyCashDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrent;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PKAccountDailyCashDestination)initWithCoder:(id)a3;
- (PKAccountDailyCashDestination)initWithDestination:(unint64_t)a3 isCurrent:(BOOL)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6;
- (unint64_t)destination;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountDailyCashDestination

- (PKAccountDailyCashDestination)initWithDestination:(unint64_t)a3 isCurrent:(BOOL)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountDailyCashDestination;
  v13 = [(PKAccountDailyCashDestination *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_destination = a3;
    v13->_current = a4;
    objc_storeStrong((id *)&v13->_localizedTitle, a5);
    objc_storeStrong((id *)&v14->_localizedSubtitle, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDailyCashDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountDailyCashDestination;
  v5 = [(PKAccountDailyCashDestination *)&v11 init];
  if (v5)
  {
    v5->_destination = [v4 decodeIntegerForKey:@"destination"];
    v5->_current = [v4 decodeBoolForKey:@"current"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t destination = self->_destination;
  id v5 = a3;
  [v5 encodeInteger:destination forKey:@"destination"];
  [v5 encodeBool:self->_current forKey:@"current"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedSubtitle forKey:@"localizedSubtitle"];
}

- (unint64_t)destination
{
  return self->_destination;
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end