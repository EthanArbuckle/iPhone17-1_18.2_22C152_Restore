@interface _PSInteractionInformation
- (_PSInteractionInformation)initWithHandle:(id)a3 interactionInformation:(id)a4;
- (id)handle;
- (id)interactionInformation;
@end

@implementation _PSInteractionInformation

- (_PSInteractionInformation)initWithHandle:(id)a3 interactionInformation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSInteractionInformation;
  v9 = [(_PSInteractionInformation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountHandle, a3);
    objc_storeStrong((id *)&v10->_interactionInfo, a4);
  }

  return v10;
}

- (id)handle
{
  return self->_accountHandle;
}

- (id)interactionInformation
{
  return self->_interactionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionInfo, 0);

  objc_storeStrong((id *)&self->_accountHandle, 0);
}

@end