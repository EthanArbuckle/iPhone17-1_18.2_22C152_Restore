@interface UITableViewRow
+ (id)row;
- (UITableViewCell)cell;
- (UITableViewRow)initWithCoder:(id)a3;
- (double)height;
- (int64_t)indentationLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setCell:(id)a3;
- (void)setHeight:(double)a3;
- (void)setIndentationLevel:(int64_t)a3;
@end

@implementation UITableViewRow

+ (id)row
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (UITableViewRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewRow;
  v5 = [(UITableViewRow *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UITableRowCell"];
    cell = v5->_cell;
    v5->_cell = (UITableViewCell *)v6;

    int v8 = [v4 containsValueForKey:@"UITableRowHeight"];
    double v9 = -1.0;
    if (v8)
    {
      objc_msgSend(v4, "decodeFloatForKey:", @"UITableRowHeight", -1.0);
      double v9 = v10;
    }
    v5->_height = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  cell = self->_cell;
  if (cell)
  {
    [v4 encodeObject:cell forKey:@"UITableRowCell"];
    double height = self->_height;
    int v8 = [(UITableViewCell *)self->_cell _tableView];
    [v8 rowHeight];
    double v10 = v9;

    if (height != v10)
    {
      *(float *)&double v11 = height;
      [v5 encodeFloat:@"UITableRowHeight" forKey:v11];
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v13 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "attempt to encode a an instance of UITableViewRow without a cell", buf, 2u);
    }
  }
  else
  {
    objc_super v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &encodeWithCoder____s_category_0) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "attempt to encode a an instance of UITableViewRow without a cell", v14, 2u);
    }
  }
}

- (void)setIndentationLevel:(int64_t)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v6 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "indentationLevel property on UITableViewRow is deprecated", buf, 2u);
    }
  }
  else
  {
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setIndentationLevel____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "indentationLevel property on UITableViewRow is deprecated", v7, 2u);
    }
  }
  [(UITableViewCell *)self->_cell setIndentationLevel:a3];
}

- (int64_t)indentationLevel
{
  if (os_variant_has_internal_diagnostics())
  {
    v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "indentationLevel property on UITableViewRow is deprecated", buf, 2u);
    }
  }
  else
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &indentationLevel___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "indentationLevel property on UITableViewRow is deprecated", v6, 2u);
    }
  }
  return [(UITableViewCell *)self->_cell indentationLevel];
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end