@interface TMLSignalDescriptor
- (TMLSignalDescriptor)initWithName:(id)a3 parameters:(id)a4;
- (TMLSignalDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7;
@end

@implementation TMLSignalDescriptor

- (TMLSignalDescriptor)initWithName:(id)a3 parameters:(id)a4
{
  return (TMLSignalDescriptor *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(self, a2, v4, a3, 1, a4, 0, 0);
}

- (TMLSignalDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)TMLSignalDescriptor;
  return [(TMLMethodDescriptor *)&v8 initWithName:a3 returnType:a4 parameters:a5 methodSelector:a6 attributes:a7];
}

@end