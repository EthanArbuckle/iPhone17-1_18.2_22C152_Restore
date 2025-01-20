@interface _UIFocusEnvironmentScrollableContainerTuple
+ (_UIFocusEnvironmentScrollableContainerTuple)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4;
- (BOOL)isEqual:(id)a3;
- (UIFocusEnvironment)owningEnvironment;
- (UIFocusItemScrollableContainer)scrollableContainer;
- (_UIFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIFocusEnvironmentScrollableContainerTuple

- (_UIFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
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
    [v15 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 463, @"Invalid parameter not satisfying: %@", @"owningEnvironment != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 464, @"Invalid parameter not satisfying: %@", @"scrollableContainer != nil" object file lineNumber description];

LABEL_3:
  v11 = [v8 focusItemContainer];

  if (v11 != v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIFocusItemContainer.m", 465, @"Invalid parameter not satisfying: %@", @"owningEnvironment.focusItemContainer == scrollableContainer" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_UIFocusEnvironmentScrollableContainerTuple;
  v12 = [(_UIFocusEnvironmentScrollableContainerTuple *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_scrollableContainer, a4);
  }

  return v13;
}

+ (_UIFocusEnvironmentScrollableContainerTuple)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithOwningEnvironment:v7 scrollableContainer:v6];

  return (_UIFocusEnvironmentScrollableContainerTuple *)v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 || (uint64_t v5 = objc_opt_class(), v5 != objc_opt_class()))
  {
    BOOL v6 = 0;
    goto LABEL_9;
  }
  id v7 = v4;
  if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260530))
  {
    v13 = [(_UIFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
    v14 = [v7 scrollableContainer];
    if (v13 == v14)
    {
      v15 = [(_UIFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
      v16 = [v7 owningEnvironment];

      if (v15 == v16) {
        goto LABEL_5;
      }
      v13 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260538) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [(_UIFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
        if (v33)
        {
          v17 = NSString;
          objc_super v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          v20 = [v17 stringWithFormat:@"<%@: %p>", v19, v33];
        }
        else
        {
          v20 = @"(nil)";
        }
        v21 = v20;
        v22 = [(_UIFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
        if (v22)
        {
          v23 = NSString;
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
        }
        else
        {
          v26 = @"(nil)";
        }
        v27 = v26;
        v28 = [v7 owningEnvironment];
        if (v28)
        {
          v29 = NSString;
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v28];
        }
        else
        {
          v32 = @"(nil)";
        }
        *(_DWORD *)buf = 138412802;
        v35 = v21;
        __int16 v36 = 2112;
        v37 = v27;
        __int16 v38 = 2112;
        v39 = v32;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Warning: encountered a single UIFocusItemContainer: %@ yielded by two mismatched owning UIFocusEnvironments: %@ and %@. UIFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);
      }
    }
    else
    {
    }
  }
LABEL_5:
  id v8 = [(_UIFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
  id v9 = [v7 owningEnvironment];
  if (v8 == v9)
  {
    v10 = [(_UIFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
    v11 = [v7 scrollableContainer];
    BOOL v6 = v10 == v11;
  }
  else
  {
    BOOL v6 = 0;
  }

LABEL_9:
  return v6;
}

- (unint64_t)hash
{
  v3 = [(_UIFocusEnvironmentScrollableContainerTuple *)self owningEnvironment];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(_UIFocusEnvironmentScrollableContainerTuple *)self scrollableContainer];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; owningEnvironment: %@; scrollableContainer: %@>",
    v5,
    self,
    self->_owningEnvironment,
  unint64_t v6 = self->_scrollableContainer);

  return v6;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end