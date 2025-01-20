@interface PKPendingInvitationRequest
- (PKAppletSubcredentialSharingInvitation)invitation;
- (PKPendingInvitationRequest)initWithInvitation:(id)a3 completion:(id)a4;
- (void)invokeCompletionWithInvitation:(id)a3 error:(id)a4;
@end

@implementation PKPendingInvitationRequest

- (PKPendingInvitationRequest)initWithInvitation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = [(PKPendingInvitationRequest *)self init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_invitation, a3);
      v13 = _Block_copy(v9);
      id completion = v12->_completion;
      v12->_id completion = v13;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)invokeCompletionWithInvitation:(id)a3 error:(id)a4
{
  id completion = (void (**)(id, id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    id v6 = self->_completion;
    self->_id completion = 0;
  }
}

- (PKAppletSubcredentialSharingInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end