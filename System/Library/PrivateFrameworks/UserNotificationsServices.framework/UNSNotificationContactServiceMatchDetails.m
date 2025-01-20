@interface UNSNotificationContactServiceMatchDetails
- (BOOL)isSuggestedMatch;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (UNSNotificationContactServiceMatchDetails)initWithCnContactIdentifier:(id)a3 cnContactFullname:(id)a4 isSuggestedContact:(BOOL)a5;
- (void)setCnContactFullname:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setIsSuggestedMatch:(BOOL)a3;
@end

@implementation UNSNotificationContactServiceMatchDetails

- (UNSNotificationContactServiceMatchDetails)initWithCnContactIdentifier:(id)a3 cnContactFullname:(id)a4 isSuggestedContact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UNSNotificationContactServiceMatchDetails;
  v10 = [(UNSNotificationContactServiceMatchDetails *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UNSNotificationContactServiceMatchDetails *)v10 setCnContactIdentifier:v8];
    [(UNSNotificationContactServiceMatchDetails *)v11 setCnContactFullname:v9];
    [(UNSNotificationContactServiceMatchDetails *)v11 setIsSuggestedMatch:v5];
  }

  return v11;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
}

- (BOOL)isSuggestedMatch
{
  return self->_isSuggestedMatch;
}

- (void)setIsSuggestedMatch:(BOOL)a3
{
  self->_isSuggestedMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);

  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
}

@end