@interface MFMailDebugIndexStatusData
- (MFMailDebugIndexStatusData)initWithPrimaryText:(id)a3 secondaryText:(id)a4 labelText:(id)a5;
- (NSString)labelText;
- (NSString)primaryText;
- (NSString)secondaryText;
- (void)setLabelText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation MFMailDebugIndexStatusData

- (MFMailDebugIndexStatusData)initWithPrimaryText:(id)a3 secondaryText:(id)a4 labelText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFMailDebugIndexStatusData;
  v12 = [(MFMailDebugIndexStatusData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primaryText, a3);
    objc_storeStrong((id *)&v13->_secondaryText, a4);
    objc_storeStrong((id *)&v13->_labelText, a5);
  }

  return v13;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);

  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end