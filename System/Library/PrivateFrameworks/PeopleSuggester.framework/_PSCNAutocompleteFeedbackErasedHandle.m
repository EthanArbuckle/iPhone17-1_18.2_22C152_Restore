@interface _PSCNAutocompleteFeedbackErasedHandle
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (_PSCNAutocompleteFeedbackErasedHandle)initWithCoder:(id)a3;
- (_PSCNAutocompleteFeedbackErasedHandle)initWithContact:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSCNAutocompleteFeedbackErasedHandle

- (_PSCNAutocompleteFeedbackErasedHandle)initWithContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackErasedHandle;
  v6 = [(_PSCNAutocompleteFeedbackErasedHandle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contact, a3);
  }

  return v7;
}

- (_PSCNAutocompleteFeedbackErasedHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PSCNAutocompleteFeedbackErasedHandle;
  id v5 = [(_PSCNAutocompleteFeedbackErasedHandle *)&v10 init];
  if (v5)
  {
    getCNContactClass_0();
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
}

@end