@interface RWIProtocolInspector
- (BOOL)connected;
- (RWIProtocolConfiguration)configuration;
- (RWIProtocolInspector)initWithController:(AugmentableInspectorController *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)inspectorControllerDestroyed;
@end

@implementation RWIProtocolInspector

- (RWIProtocolInspector)initWithController:(AugmentableInspectorController *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolInspector;
  v4 = [(RWIProtocolInspector *)&v6 init];
  if (v4)
  {
    v4->_inspectorController = a3;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  inspectorController = self->_inspectorController;
  if (inspectorController) {
    (*((void (**)(AugmentableInspectorController *, void))inspectorController->var0 + 3))(inspectorController, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolInspector;
  [(RWIProtocolInspector *)&v4 dealloc];
}

- (RWIProtocolConfiguration)configuration
{
  return (RWIProtocolConfiguration *)self->_configuration.m_ptr;
}

- (BOOL)connected
{
  inspectorController = self->_inspectorController;
  if (inspectorController) {
    LOBYTE(inspectorController) = *(_DWORD *)((*((uint64_t (**)(AugmentableInspectorController *, SEL))inspectorController->var0
  }
                                               + 4))(inspectorController, a2)+ 20) != 0;
  return (char)inspectorController;
}

- (void)inspectorControllerDestroyed
{
  self->_inspectorController = 0;
  value = self->_inspectorControllerClient.__ptr_.__value_;
  self->_inspectorControllerClient.__ptr_.__value_ = 0;
  if (value) {
    JUMPOUT(0x22A6707E0);
  }
}

- (void).cxx_destruct
{
  value = self->_inspectorControllerClient.__ptr_.__value_;
  self->_inspectorControllerClient.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x22A6707E0](value, 0x81C40803F642BLL);
  }
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end