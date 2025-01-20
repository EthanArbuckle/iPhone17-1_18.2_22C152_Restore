@interface _MSVSQLDatabaseAggregateFunctionDescriptor
@end

@implementation _MSVSQLDatabaseAggregateFunctionDescriptor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_remove, 0);
  objc_storeStrong(&self->_add, 0);
  objc_storeStrong(&self->_start, 0);
}

@end