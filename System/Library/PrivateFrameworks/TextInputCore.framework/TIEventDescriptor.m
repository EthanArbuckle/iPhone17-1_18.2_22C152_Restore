@interface TIEventDescriptor
+ (id)eventDescriptorWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6;
- (BOOL)includeTestingParameters;
- (NSArray)fieldDescriptors;
- (NSString)eventDescription;
- (NSString)eventName;
- (TIEventDescriptor)initWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6;
@end

@implementation TIEventDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDescriptors, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

- (BOOL)includeTestingParameters
{
  return self->_includeTestingParameters;
}

- (NSArray)fieldDescriptors
{
  return self->_fieldDescriptors;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (TIEventDescriptor)initWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIEventDescriptor;
  v14 = [(TIEventDescriptor *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventName, a3);
    objc_storeStrong((id *)&v15->_eventDescription, a4);
    objc_storeStrong((id *)&v15->_fieldDescriptors, a5);
    v15->_includeTestingParameters = a6;
  }

  return v15;
}

+ (id)eventDescriptorWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[TIEventDescriptor alloc] initWithEventName:v11 eventDescription:v10 fieldDescriptors:v9 includeTestingParameters:v6];

  return v12;
}

@end