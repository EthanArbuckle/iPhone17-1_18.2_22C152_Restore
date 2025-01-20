@interface _UIFocusEnvironmentContainerTuple
+ (id)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4;
+ (id)tupleWithRequiredContainerFromEnvironment:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3;
- (BOOL)isScrollableContainer;
- (UIFocusEnvironment)owningEnvironment;
- (UIFocusItemContainer)itemContainer;
- (_UIFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIFocusEnvironmentContainerTuple

- (_UIFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 399, @"Invalid parameter not satisfying: %@", @"owningEnvironment != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 400, @"Invalid parameter not satisfying: %@", @"itemContainer != nil" object file lineNumber description];

LABEL_3:
  v11 = [v8 focusItemContainer];

  if (v11 != v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 401, @"Invalid parameter not satisfying: %@", @"owningEnvironment.focusItemContainer == itemContainer" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_UIFocusEnvironmentContainerTuple;
  v12 = [(_UIFocusEnvironmentContainerTuple *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_itemContainer, a4);
    v13->_isScrollableContainer = _UIFocusItemContainerIsScrollableContainer(v10);
  }

  return v13;
}

+ (id)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithOwningEnvironment:v7 itemContainer:v6];

  return v8;
}

+ (id)tupleWithRequiredContainerFromEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 focusItemContainer];
  id v6 = [a1 tupleWithOwningEnvironment:v4 itemContainer:v5];

  return v6;
}

- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  owningEnvironment = self->_owningEnvironment;
  itemContainer = self->_itemContainer;
  id v8 = (UIFocusEnvironment *)v4[2];
  id v7 = (UIFocusItemContainer *)v4[3];
  if ((*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260520) & 1) != 0
    && itemContainer == v7
    && owningEnvironment != v8)
  {
    v13 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260528) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v7;
      v34 = v8;
      v31 = owningEnvironment;
      v32 = itemContainer;
      v14 = [(_UIFocusEnvironmentContainerTuple *)self itemContainer];
      if (v14)
      {
        v15 = NSString;
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        objc_super v18 = [v15 stringWithFormat:@"<%@: %p>", v17, v14];
      }
      else
      {
        objc_super v18 = @"(nil)";
      }
      v19 = v18;
      v20 = [(_UIFocusEnvironmentContainerTuple *)self owningEnvironment];
      if (v20)
      {
        v21 = NSString;
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v24 = [v21 stringWithFormat:@"<%@: %p>", v23, v20];
      }
      else
      {
        v24 = @"(nil)";
      }
      v25 = v24;
      v26 = [v4 owningEnvironment];
      if (v26)
      {
        v27 = NSString;
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = [v27 stringWithFormat:@"<%@: %p>", v29, v26];
      }
      else
      {
        v30 = @"(nil)";
      }
      *(_DWORD *)buf = 138412802;
      v36 = v19;
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2112;
      v40 = v30;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Warning: encountered a single UIFocusItemContainer: %@ yielded by two mismatched owning UIFocusEnvironments: %@ and %@. UIFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      owningEnvironment = v31;
      itemContainer = v32;
      id v7 = v33;
      id v8 = v34;
    }
  }
  BOOL v10 = owningEnvironment == v8 && itemContainer == v7;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = v4
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && [(_UIFocusEnvironmentContainerTuple *)self isEqualToEnvironmentContainerTuple:v4];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_UIFocusEnvironmentContainerTuple *)self owningEnvironment];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(_UIFocusEnvironmentContainerTuple *)self itemContainer];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; owningEnvironment: %@; itemContainer: %@>",
    v5,
    self,
    self->_owningEnvironment,
  unint64_t v6 = self->_itemContainer);

  return v6;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemContainer)itemContainer
{
  return self->_itemContainer;
}

- (BOOL)isScrollableContainer
{
  return self->_isScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end