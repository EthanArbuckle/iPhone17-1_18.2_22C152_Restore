@interface LayoutConstraintActivationHelper
- (LayoutConstraintActivationHelper)init;
- (NSMutableArray)pendingConstraintsToActivate;
- (NSMutableArray)pendingConstraintsToDeactivate;
- (id)pendingConstraintsToActivate:(BOOL)a3;
- (void)clearPendingConstraints;
- (void)commitPendingConstraints;
- (void)scheduleConstraint:(id)a3 activate:(BOOL)a4;
- (void)scheduleConstraints:(id)a3 activate:(BOOL)a4;
- (void)setPendingConstraintsToActivate:(id)a3;
- (void)setPendingConstraintsToDeactivate:(id)a3;
@end

@implementation LayoutConstraintActivationHelper

- (LayoutConstraintActivationHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)LayoutConstraintActivationHelper;
  v2 = [(LayoutConstraintActivationHelper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pendingConstraintsToActivate = v2->_pendingConstraintsToActivate;
    v2->_pendingConstraintsToActivate = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    pendingConstraintsToDeactivate = v2->_pendingConstraintsToDeactivate;
    v2->_pendingConstraintsToDeactivate = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)scheduleConstraint:(id)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    if (v4)
    {
      objc_super v8 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
      [v8 removeObject:v14];

      unsigned __int8 v9 = [v14 isActive];
      v7 = v14;
      if (v9) {
        goto LABEL_8;
      }
      v10 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
    }
    else
    {
      v11 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
      [v11 removeObject:v14];

      unsigned int v12 = [v14 isActive];
      v7 = v14;
      if (!v12) {
        goto LABEL_8;
      }
      v10 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
    }
    v13 = v10;
    [v10 addObject:v14];

    v7 = v14;
  }
LABEL_8:
}

- (void)scheduleConstraints:(id)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[LayoutConstraintActivationHelper scheduleConstraint:activate:](self, "scheduleConstraint:activate:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v4, (void)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)pendingConstraintsToActivate:(BOOL)a3
{
  if (a3) {
    [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
  }
  else {
  uint64_t v3 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
  }
  id v4 = [v3 copy];

  return v4;
}

- (void)clearPendingConstraints
{
  uint64_t v3 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
  [v3 removeAllObjects];

  id v4 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
  [v4 removeAllObjects];
}

- (void)commitPendingConstraints
{
  uint64_t v3 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToDeactivate];
    +[NSLayoutConstraint deactivateConstraints:v5];
  }
  id v6 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(LayoutConstraintActivationHelper *)self pendingConstraintsToActivate];
    +[NSLayoutConstraint activateConstraints:v8];
  }

  [(LayoutConstraintActivationHelper *)self clearPendingConstraints];
}

- (NSMutableArray)pendingConstraintsToActivate
{
  return self->_pendingConstraintsToActivate;
}

- (void)setPendingConstraintsToActivate:(id)a3
{
}

- (NSMutableArray)pendingConstraintsToDeactivate
{
  return self->_pendingConstraintsToDeactivate;
}

- (void)setPendingConstraintsToDeactivate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConstraintsToDeactivate, 0);

  objc_storeStrong((id *)&self->_pendingConstraintsToActivate, 0);
}

@end