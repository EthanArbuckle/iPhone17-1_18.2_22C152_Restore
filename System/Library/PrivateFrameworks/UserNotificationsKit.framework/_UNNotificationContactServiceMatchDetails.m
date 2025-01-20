@interface _UNNotificationContactServiceMatchDetails
- (BOOL)isSuggestedMatch;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (_UNNotificationContactServiceMatchDetails)initWithCnContactIdentifier:(id)a3 cnContactFullname:(id)a4 isSuggestedContact:(BOOL)a5;
- (void)setCnContactFullname:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setIsSuggestedMatch:(BOOL)a3;
@end

@implementation _UNNotificationContactServiceMatchDetails

- (_UNNotificationContactServiceMatchDetails)initWithCnContactIdentifier:(id)a3 cnContactFullname:(id)a4 isSuggestedContact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContactServiceMatchDetails;
  v10 = [(_UNNotificationContactServiceMatchDetails *)&v12 init];
  if (v10)
  {
    NCRegisterUserNotificationsUILogging();
    [(_UNNotificationContactServiceMatchDetails *)v10 setCnContactIdentifier:v8];
    [(_UNNotificationContactServiceMatchDetails *)v10 setCnContactFullname:v9];
    [(_UNNotificationContactServiceMatchDetails *)v10 setIsSuggestedMatch:v5];
  }

  return v10;
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