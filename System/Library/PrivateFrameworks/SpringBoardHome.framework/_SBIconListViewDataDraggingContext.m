@interface _SBIconListViewDataDraggingContext
- (BOOL)allowsMoveOperation;
- (NSString)bestAvailableUTI;
- (NSString)description;
- (SBIconView)iconView;
- (_SBIconListViewDataDraggingContext)initWithIconView:(id)a3 bestUTI:(id)a4 allowsMoveOperation:(BOOL)a5 fileOptions:(int64_t)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)fileOptions;
@end

@implementation _SBIconListViewDataDraggingContext

- (_SBIconListViewDataDraggingContext)initWithIconView:(id)a3 bestUTI:(id)a4 allowsMoveOperation:(BOOL)a5 fileOptions:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SBIconListViewDataDraggingContext;
  v13 = [(_SBIconListViewDataDraggingContext *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_iconView, a3);
    objc_storeStrong((id *)&v14->_bestAvailableUTI, a4);
    v14->_allowsMoveOperation = a5;
    v14->_fileOptions = a6;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)[(_SBIconListViewDataDraggingContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBIconListViewDataDraggingContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_iconView withName:@"iconView"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBIconListViewDataDraggingContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(_SBIconListViewDataDraggingContext *)self succinctDescriptionBuilder];
  [v4 appendString:self->_bestAvailableUTI withName:@"bestAvailableUTI"];
  id v5 = (id)[v4 appendBool:self->_allowsMoveOperation withName:@"allowsMoveOperation"];
  id v6 = (id)[v4 appendInteger:self->_fileOptions withName:@"fileOptions"];
  return v4;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (NSString)bestAvailableUTI
{
  return self->_bestAvailableUTI;
}

- (BOOL)allowsMoveOperation
{
  return self->_allowsMoveOperation;
}

- (int64_t)fileOptions
{
  return self->_fileOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAvailableUTI, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end