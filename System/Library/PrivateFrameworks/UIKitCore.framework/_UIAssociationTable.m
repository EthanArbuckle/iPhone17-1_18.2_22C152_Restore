@interface _UIAssociationTable
- (BOOL)hasLeftValuesForRightValue:(id)a3;
- (BOOL)hasRightValuesForLeftValue:(id)a3;
- (BOOL)isEmpty;
- (_UIAssociationTable)initWithLeftValueOptions:(unint64_t)a3 rightValueOptions:(unint64_t)a4;
- (id)description;
- (id)leftValueEnumerable;
- (id)leftValueEnumerableForRightValue:(id)a3;
- (id)leftValues;
- (id)leftValuesForRightValue:(id)a3;
- (id)rightValueEnumerable;
- (id)rightValueEnumerableForLeftValue:(id)a3;
- (id)rightValues;
- (id)rightValuesForLeftValue:(id)a3;
- (void)registerAssociationWithLeftValue:(id)a3 rightValue:(id)a4;
- (void)unregisterAssociationWithLeftValue:(id)a3 rightValue:(id)a4;
@end

@implementation _UIAssociationTable

- (BOOL)hasLeftValuesForRightValue:(id)a3
{
  v3 = [(NSMapTable *)self->_rightToLeftHashTables objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)leftValuesForRightValue:(id)a3
{
  v3 = [(NSMapTable *)self->_rightToLeftHashTables objectForKey:a3];
  BOOL v4 = [v3 allObjects];
  v5 = v4;
  if (!v4) {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (BOOL)isEmpty
{
  return [(NSMapTable *)self->_leftToRightHashTables count] == 0;
}

- (void)unregisterAssociationWithLeftValue:(id)a3 rightValue:(id)a4
{
  leftToRightHashTables = self->_leftToRightHashTables;
  id v7 = a4;
  id v8 = a3;
  unregisterObjectFromMapOfHashTables(leftToRightHashTables, v8, v7);
  unregisterObjectFromMapOfHashTables(self->_rightToLeftHashTables, v7, v8);
}

- (BOOL)hasRightValuesForLeftValue:(id)a3
{
  v3 = [(NSMapTable *)self->_leftToRightHashTables objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)registerAssociationWithLeftValue:(id)a3 rightValue:(id)a4
{
  leftToRightHashTables = self->_leftToRightHashTables;
  id v7 = a4;
  id v8 = a3;
  registerObjectInMapOfHashTables(leftToRightHashTables, v8, v7);
  registerObjectInMapOfHashTables(self->_rightToLeftHashTables, v7, v8);
}

- (id)rightValueEnumerableForLeftValue:(id)a3
{
  return [(NSMapTable *)self->_leftToRightHashTables objectForKey:a3];
}

- (_UIAssociationTable)initWithLeftValueOptions:(unint64_t)a3 rightValueOptions:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_UIAssociationTable;
  id v6 = [(_UIAssociationTable *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:a3 valueOptions:512 capacity:16];
    leftToRightHashTables = v6->_leftToRightHashTables;
    v6->_leftToRightHashTables = (NSMapTable *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:a4 valueOptions:512 capacity:16];
    rightToLeftHashTables = v6->_rightToLeftHashTables;
    v6->_rightToLeftHashTables = (NSMapTable *)v9;

    v11 = v6;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p left->right=%@, right->left=%@>", v5, self, self->_leftToRightHashTables, self->_rightToLeftHashTables];

  return v6;
}

- (id)leftValues
{
  return NSAllMapTableKeys(self->_leftToRightHashTables);
}

- (id)rightValues
{
  return NSAllMapTableKeys(self->_rightToLeftHashTables);
}

- (id)leftValueEnumerable
{
  return self->_leftToRightHashTables;
}

- (id)rightValueEnumerable
{
  return self->_rightToLeftHashTables;
}

- (id)rightValuesForLeftValue:(id)a3
{
  v3 = [(NSMapTable *)self->_leftToRightHashTables objectForKey:a3];
  BOOL v4 = [v3 allObjects];
  v5 = v4;
  if (!v4) {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (id)leftValueEnumerableForRightValue:(id)a3
{
  return [(NSMapTable *)self->_rightToLeftHashTables objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightToLeftHashTables, 0);
  objc_storeStrong((id *)&self->_leftToRightHashTables, 0);
}

@end