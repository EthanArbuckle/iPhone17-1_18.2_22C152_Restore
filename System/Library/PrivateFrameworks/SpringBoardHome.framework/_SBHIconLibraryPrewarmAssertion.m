@interface _SBHIconLibraryPrewarmAssertion
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (SBHIconLibraryTableViewController)iconLibraryTableViewController;
- (_SBHIconLibraryPrewarmAssertion)initWithReason:(id)a3 iconLibraryTableViewController:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBHIconLibraryPrewarmAssertion

- (_SBHIconLibraryPrewarmAssertion)initWithReason:(id)a3 iconLibraryTableViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBHIconLibraryPrewarmAssertion;
  v8 = [(_SBHIconLibraryPrewarmAssertion *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeWeak((id *)&v8->_iconLibraryTableViewController, v7);
  }

  return v8;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(_SBHIconLibraryPrewarmAssertion *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)_SBHIconLibraryPrewarmAssertion;
  [(_SBHIconLibraryPrewarmAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (self->_invalidated) {
    NSLog(&cfstr_ThisAssertionH.isa, a2, 0);
  }
  self->_invalidated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
  [WeakRetained _invalidatePrewarmAssertion:self];
}

- (unint64_t)hash
{
  return [(NSString *)self->_reason hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBHIconLibraryPrewarmAssertion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    v8 = v7;
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained(v7 + 3);
      id v10 = objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
      if (WeakRetained == v10) {
        char v11 = [v8[2] isEqual:self->_reason];
      }
      else {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBHIconLibraryTableViewController)iconLibraryTableViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
  return (SBHIconLibraryTableViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconLibraryTableViewController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end