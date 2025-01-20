@interface RWIProtocolConfiguration
- (RWIProtocolCSSDomainEventDispatcher)cssEventDispatcher;
- (RWIProtocolCSSDomainHandler)cssHandler;
- (RWIProtocolConfiguration)initWithController:(AugmentableInspectorController *)a3;
- (RWIProtocolConsoleDomainEventDispatcher)consoleEventDispatcher;
- (RWIProtocolDOMDomainEventDispatcher)domEventDispatcher;
- (RWIProtocolDOMDomainHandler)domHandler;
- (RWIProtocolDOMStorageDomainEventDispatcher)domStorageEventDispatcher;
- (RWIProtocolDOMStorageDomainHandler)domStorageHandler;
- (RWIProtocolNetworkDomainEventDispatcher)networkEventDispatcher;
- (RWIProtocolNetworkDomainHandler)networkHandler;
- (RWIProtocolPageDomainEventDispatcher)pageEventDispatcher;
- (RWIProtocolPageDomainHandler)pageHandler;
- (id).cxx_construct;
- (void)setCSSHandler:(id)a3;
- (void)setDOMHandler:(id)a3;
- (void)setDOMStorageHandler:(id)a3;
- (void)setNetworkHandler:(id)a3;
- (void)setPageHandler:(id)a3;
@end

@implementation RWIProtocolConfiguration

- (RWIProtocolConfiguration)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolConfiguration;
  result = [(RWIProtocolConfiguration *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)setCSSHandler:(id)a3
{
  id m_ptr = self->_cssHandler.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_cssHandler.m_ptr;
    }
    self->_cssHandler.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x18);
    Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v6, a3);
    v18 = v6;
    v16[0] = "CSS";
    v16[1] = 4;
    std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorCSSBackendDispatcher>>((uint64_t)v16, (uint64_t)self->_controller, (uint64_t *)&v18, &v17);
    controller = self->_controller;
    v8 = v17;
    v17 = 0;
    v15 = v8;
    (*((void (**)(AugmentableInspectorController *, Inspector::InspectorAgentBase **))controller->var0 + 6))(controller, &v15);
    v10 = v15;
    v15 = 0;
    if (v10) {
      (*(void (**)(Inspector::InspectorAgentBase *))(*(void *)v10 + 8))(v10);
    }
    v11 = v17;
    v17 = 0;
    if (v11)
    {
      Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(v11, v9);
      WTF::fastFree(v12, v13);
    }
    v14 = v18;
    v18 = 0;
    if (v14) {
      std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&v18, v14);
    }
  }
}

- (RWIProtocolCSSDomainHandler)cssHandler
{
  return (RWIProtocolCSSDomainHandler *)self->_cssHandler.m_ptr;
}

- (RWIProtocolCSSDomainEventDispatcher)cssEventDispatcher
{
  result = (RWIProtocolCSSDomainEventDispatcher *)self->_cssEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolCSSDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_cssEventDispatcher.m_ptr;
    self->_cssEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolCSSDomainEventDispatcher *)self->_cssEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (RWIProtocolConsoleDomainEventDispatcher)consoleEventDispatcher
{
  result = (RWIProtocolConsoleDomainEventDispatcher *)self->_consoleEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolConsoleDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_consoleEventDispatcher.m_ptr;
    self->_consoleEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolConsoleDomainEventDispatcher *)self->_consoleEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (void)setDOMHandler:(id)a3
{
  id m_ptr = self->_domHandler.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_domHandler.m_ptr;
    }
    self->_domHandler.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x18);
    Inspector::ObjCInspectorDOMBackendDispatcher::ObjCInspectorDOMBackendDispatcher(v6, a3);
    v18 = v6;
    v16[0] = "DOM";
    v16[1] = 4;
    std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMBackendDispatcher>>((uint64_t)v16, (uint64_t)self->_controller, (uint64_t *)&v18, &v17);
    controller = self->_controller;
    v8 = v17;
    v17 = 0;
    v15 = v8;
    (*((void (**)(AugmentableInspectorController *, Inspector::InspectorAgentBase **))controller->var0 + 6))(controller, &v15);
    v10 = v15;
    v15 = 0;
    if (v10) {
      (*(void (**)(Inspector::InspectorAgentBase *))(*(void *)v10 + 8))(v10);
    }
    v11 = v17;
    v17 = 0;
    if (v11)
    {
      Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(v11, v9);
      WTF::fastFree(v12, v13);
    }
    v14 = v18;
    v18 = 0;
    if (v14) {
      std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&v18, v14);
    }
  }
}

- (RWIProtocolDOMDomainHandler)domHandler
{
  return (RWIProtocolDOMDomainHandler *)self->_domHandler.m_ptr;
}

- (RWIProtocolDOMDomainEventDispatcher)domEventDispatcher
{
  result = (RWIProtocolDOMDomainEventDispatcher *)self->_domEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolDOMDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_domEventDispatcher.m_ptr;
    self->_domEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolDOMDomainEventDispatcher *)self->_domEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (void)setDOMStorageHandler:(id)a3
{
  id m_ptr = self->_domStorageHandler.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_domStorageHandler.m_ptr;
    }
    self->_domStorageHandler.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x18);
    Inspector::ObjCInspectorDOMStorageBackendDispatcher::ObjCInspectorDOMStorageBackendDispatcher(v6, a3);
    v18 = v6;
    v16[0] = "DOMStorage";
    v16[1] = 11;
    std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMStorageBackendDispatcher>>((uint64_t)v16, (uint64_t)self->_controller, (uint64_t *)&v18, &v17);
    controller = self->_controller;
    v8 = v17;
    v17 = 0;
    v15 = v8;
    (*((void (**)(AugmentableInspectorController *, Inspector::InspectorAgentBase **))controller->var0 + 6))(controller, &v15);
    v10 = v15;
    v15 = 0;
    if (v10) {
      (*(void (**)(Inspector::InspectorAgentBase *))(*(void *)v10 + 8))(v10);
    }
    v11 = v17;
    v17 = 0;
    if (v11)
    {
      Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(v11, v9);
      WTF::fastFree(v12, v13);
    }
    v14 = v18;
    v18 = 0;
    if (v14) {
      std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&v18, v14);
    }
  }
}

- (RWIProtocolDOMStorageDomainHandler)domStorageHandler
{
  return (RWIProtocolDOMStorageDomainHandler *)self->_domStorageHandler.m_ptr;
}

- (RWIProtocolDOMStorageDomainEventDispatcher)domStorageEventDispatcher
{
  result = (RWIProtocolDOMStorageDomainEventDispatcher *)self->_domStorageEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolDOMStorageDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_domStorageEventDispatcher.m_ptr;
    self->_domStorageEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolDOMStorageDomainEventDispatcher *)self->_domStorageEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (void)setNetworkHandler:(id)a3
{
  id m_ptr = self->_networkHandler.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_networkHandler.m_ptr;
    }
    self->_networkHandler.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x18);
    Inspector::ObjCInspectorNetworkBackendDispatcher::ObjCInspectorNetworkBackendDispatcher(v6, a3);
    v18 = v6;
    v16[0] = "Network";
    v16[1] = 8;
    std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorNetworkBackendDispatcher>>((uint64_t)v16, (uint64_t)self->_controller, (uint64_t *)&v18, &v17);
    controller = self->_controller;
    v8 = v17;
    v17 = 0;
    v15 = v8;
    (*((void (**)(AugmentableInspectorController *, Inspector::InspectorAgentBase **))controller->var0 + 6))(controller, &v15);
    v10 = v15;
    v15 = 0;
    if (v10) {
      (*(void (**)(Inspector::InspectorAgentBase *))(*(void *)v10 + 8))(v10);
    }
    v11 = v17;
    v17 = 0;
    if (v11)
    {
      Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(v11, v9);
      WTF::fastFree(v12, v13);
    }
    v14 = v18;
    v18 = 0;
    if (v14) {
      std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&v18, v14);
    }
  }
}

- (RWIProtocolNetworkDomainHandler)networkHandler
{
  return (RWIProtocolNetworkDomainHandler *)self->_networkHandler.m_ptr;
}

- (RWIProtocolNetworkDomainEventDispatcher)networkEventDispatcher
{
  result = (RWIProtocolNetworkDomainEventDispatcher *)self->_networkEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolNetworkDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_networkEventDispatcher.m_ptr;
    self->_networkEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolNetworkDomainEventDispatcher *)self->_networkEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (void)setPageHandler:(id)a3
{
  id m_ptr = self->_pageHandler.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_pageHandler.m_ptr;
    }
    self->_pageHandler.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x18);
    Inspector::ObjCInspectorPageBackendDispatcher::ObjCInspectorPageBackendDispatcher(v6, a3);
    v18 = v6;
    v16[0] = "Page";
    v16[1] = 5;
    std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorPageBackendDispatcher>>((uint64_t)v16, (uint64_t)self->_controller, (uint64_t *)&v18, &v17);
    controller = self->_controller;
    v8 = v17;
    v17 = 0;
    v15 = v8;
    (*((void (**)(AugmentableInspectorController *, Inspector::InspectorAgentBase **))controller->var0 + 6))(controller, &v15);
    v10 = v15;
    v15 = 0;
    if (v10) {
      (*(void (**)(Inspector::InspectorAgentBase *))(*(void *)v10 + 8))(v10);
    }
    v11 = v17;
    v17 = 0;
    if (v11)
    {
      Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(v11, v9);
      WTF::fastFree(v12, v13);
    }
    v14 = v18;
    v18 = 0;
    if (v14) {
      std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&v18, v14);
    }
  }
}

- (RWIProtocolPageDomainHandler)pageHandler
{
  return (RWIProtocolPageDomainHandler *)self->_pageHandler.m_ptr;
}

- (RWIProtocolPageDomainEventDispatcher)pageEventDispatcher
{
  result = (RWIProtocolPageDomainEventDispatcher *)self->_pageEventDispatcher.m_ptr;
  if (!result)
  {
    result = [[RWIProtocolPageDomainEventDispatcher alloc] initWithController:self->_controller];
    id m_ptr = self->_pageEventDispatcher.m_ptr;
    self->_pageEventDispatcher.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (RWIProtocolPageDomainEventDispatcher *)self->_pageEventDispatcher.m_ptr;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  id m_ptr = self->_pageEventDispatcher.m_ptr;
  self->_pageEventDispatcher.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_pageHandler.m_ptr;
  self->_pageHandler.id m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  objc_super v5 = self->_networkEventDispatcher.m_ptr;
  self->_networkEventDispatcher.id m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_networkHandler.m_ptr;
  self->_networkHandler.id m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->_domStorageEventDispatcher.m_ptr;
  self->_domStorageEventDispatcher.id m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  v8 = self->_domStorageHandler.m_ptr;
  self->_domStorageHandler.id m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  v9 = self->_domEventDispatcher.m_ptr;
  self->_domEventDispatcher.id m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  v10 = self->_domHandler.m_ptr;
  self->_domHandler.id m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  v11 = self->_consoleEventDispatcher.m_ptr;
  self->_consoleEventDispatcher.id m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  v12 = self->_cssEventDispatcher.m_ptr;
  self->_cssEventDispatcher.id m_ptr = 0;
  if (v12) {
    CFRelease(v12);
  }
  v13 = self->_cssHandler.m_ptr;
  self->_cssHandler.id m_ptr = 0;
  if (v13)
  {
    CFRelease(v13);
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

- (uint64_t)setCSSHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

@end