@interface PKObjectProperty
@end

@implementation PKObjectProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueGetter, 0);
  objc_storeStrong((id *)&self->_aClass, 0);
  objc_storeStrong((id *)&self->_variableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end