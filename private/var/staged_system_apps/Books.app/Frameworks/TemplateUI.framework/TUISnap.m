@interface TUISnap
- (BOOL)isEqual:(id)a3;
- (NSArray)values;
- (TUISnap)initWithValue:(double)a3;
- (TUISnap)initWithValues:(id)a3;
- (TUISnap)snapWithIdentifier:(id)a3;
- (TUISnap)snapWithMax:(double)a3;
- (TUISnap)snapWithStep:(double)a3;
- (double)valueForValue:(double)a3;
- (id)_valueForValue:(double)a3;
- (id)description;
- (id)identifierForValue:(double)a3;
- (id)snapByAddingValue:(double)a3;
- (unint64_t)stepForValue:(double)a3;
@end

@implementation TUISnap

- (BOOL)isEqual:(id)a3
{
  v4 = (TUISnap *)a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  unsigned __int8 v7 = v6 == self;
  if (v6) {
    BOOL v8 = v6 == self;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    unsigned __int8 v7 = [(NSArray *)self->_values isEqualToArray:v6->_values];
  }

  return v7;
}

- (TUISnap)initWithValue:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUISnap;
  v4 = [(TUISnap *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [[_TUISnapValue alloc] initWithValue:a3];
    v10 = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:&v10 count:1];
    values = v4->_values;
    v4->_values = (NSArray *)v6;
  }
  return v4;
}

- (TUISnap)initWithValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISnap;
  uint64_t v6 = [(TUISnap *)&v9 init];
  unsigned __int8 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_values, a3);
  }

  return v7;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 appendString:@"["];
  values = self->_values;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7C918;
  v7[3] = &unk_253E88;
  id v5 = v3;
  id v8 = v5;
  [(NSArray *)values enumerateObjectsUsingBlock:v7];
  [v5 appendString:@"]"];

  return v5;
}

- (id)snapByAddingValue:(double)a3
{
  values = self->_values;
  v4 = [[_TUISnapValue alloc] initWithValue:a3];
  id v5 = [(NSArray *)values arrayByAddingObject:v4];

  uint64_t v6 = [[TUISnap alloc] initWithValues:v5];

  return v6;
}

- (TUISnap)snapWithIdentifier:(id)a3
{
  values = self->_values;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)values lastObject];
  unsigned __int8 v7 = [v6 valueWithIdentifier:v5];

  id v8 = [(NSArray *)self->_values mutableCopy];
  [v8 removeLastObject];
  [v8 addObject:v7];
  objc_super v9 = [[TUISnap alloc] initWithValues:v8];

  return v9;
}

- (TUISnap)snapWithStep:(double)a3
{
  id v5 = [(NSArray *)self->_values lastObject];
  uint64_t v6 = [v5 valueWithStep:a3];

  id v7 = [(NSArray *)self->_values mutableCopy];
  [v7 removeLastObject];
  [v7 addObject:v6];
  id v8 = [[TUISnap alloc] initWithValues:v7];

  return v8;
}

- (TUISnap)snapWithMax:(double)a3
{
  id v5 = [(NSArray *)self->_values lastObject];
  uint64_t v6 = [v5 valueWithMax:a3];

  id v7 = [(NSArray *)self->_values mutableCopy];
  [v7 removeLastObject];
  [v7 addObject:v6];
  id v8 = [[TUISnap alloc] initWithValues:v7];

  return v8;
}

- (id)_valueForValue:(double)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_values;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {

LABEL_14:
    id v8 = [(NSArray *)self->_values firstObject];
    goto LABEL_15;
  }
  id v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v16;
  while (2)
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
      [v12 value:v15];
      if (v13 > a3)
      {
        id v8 = v11;
        goto LABEL_11;
      }
      id v8 = v12;

      v10 = (char *)v10 + 1;
      v11 = v8;
    }
    while (v7 != v10);
    id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_11:

  if (!v8) {
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (double)valueForValue:(double)a3
{
  v4 = -[TUISnap _valueForValue:](self, "_valueForValue:");
  [v4 valueForStep:[v4 stepForValue:a3]];
  double v6 = v5;

  return v6;
}

- (id)identifierForValue:(double)a3
{
  v3 = [(TUISnap *)self _valueForValue:a3];
  v4 = [v3 identifier];

  return v4;
}

- (unint64_t)stepForValue:(double)a3
{
  v4 = -[TUISnap _valueForValue:](self, "_valueForValue:");
  id v5 = [v4 stepForValue:a3];

  return (unint64_t)v5;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end