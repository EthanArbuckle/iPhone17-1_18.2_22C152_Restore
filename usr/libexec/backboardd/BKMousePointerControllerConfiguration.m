@interface BKMousePointerControllerConfiguration
- (BKCADisplayProvider)displayProvider;
- (BKDisplayController)displayController;
- (BKHIDClientConnectionManager)clientConnectionManager;
- (BKHIDEventDeliveryManager)eventDeliveryManager;
- (BKHIDEventHitTestDispatcher)eventDispatcher;
- (BKKeyboardHIDEventProcessor)keyboardEventProcessor;
- (BKMousePointerAnalyticsReporter)analyticsReporter;
- (BKMousePointerDeviceAvailabilityMonitor)deviceAvailabilityMonitor;
- (BKMousePointerServiceServer)serviceServer;
- (BKOrientationManager)orientationManager;
- (BKSLocalDefaults)localDefaults;
- (BKSmartCoverHIDEventProcessor)smartCoverEventProcessor;
- (BKTouchDeliveryPolicyServer)touchDeliveryPolicyServer;
- (BKTouchPadManager)touchPadManager;
- (BOOL)displayLinkDisabled;
- (BOOL)shouldUseHighFrequencyAttributeOption;
- (Class)displayLinkClass;
- (double)mainDisplayCornerRadius;
- (void)setAnalyticsReporter:(id)a3;
- (void)setClientConnectionManager:(id)a3;
- (void)setDeviceAvailabilityMonitor:(id)a3;
- (void)setDisplayController:(id)a3;
- (void)setDisplayLinkClass:(Class)a3;
- (void)setDisplayLinkDisabled:(BOOL)a3;
- (void)setDisplayProvider:(id)a3;
- (void)setEventDeliveryManager:(id)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setKeyboardEventProcessor:(id)a3;
- (void)setLocalDefaults:(id)a3;
- (void)setMainDisplayCornerRadius:(double)a3;
- (void)setOrientationManager:(id)a3;
- (void)setServiceServer:(id)a3;
- (void)setShouldUseHighFrequencyAttributeOption:(BOOL)a3;
- (void)setSmartCoverEventProcessor:(id)a3;
- (void)setTouchDeliveryPolicyServer:(id)a3;
- (void)setTouchPadManager:(id)a3;
@end

@implementation BKMousePointerControllerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkClass, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
  objc_storeStrong((id *)&self->_serviceServer, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_deviceAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_clientConnectionManager, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_eventDeliveryManager, 0);
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_smartCoverEventProcessor, 0);
  objc_storeStrong((id *)&self->_touchPadManager, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);

  objc_storeStrong((id *)&self->_displayProvider, 0);
}

- (void)setMainDisplayCornerRadius:(double)a3
{
  self->_mainDisplayCornerRadius = a3;
}

- (double)mainDisplayCornerRadius
{
  return self->_mainDisplayCornerRadius;
}

- (void)setShouldUseHighFrequencyAttributeOption:(BOOL)a3
{
  self->_shouldUseHighFrequencyAttributeOption = a3;
}

- (BOOL)shouldUseHighFrequencyAttributeOption
{
  return self->_shouldUseHighFrequencyAttributeOption;
}

- (void)setDisplayLinkDisabled:(BOOL)a3
{
  self->_displayLinkDisabled = a3;
}

- (BOOL)displayLinkDisabled
{
  return self->_displayLinkDisabled;
}

- (void)setDisplayLinkClass:(Class)a3
{
}

- (Class)displayLinkClass
{
  return self->_displayLinkClass;
}

- (void)setEventDispatcher:(id)a3
{
}

- (BKHIDEventHitTestDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setTouchDeliveryPolicyServer:(id)a3
{
}

- (BKTouchDeliveryPolicyServer)touchDeliveryPolicyServer
{
  return self->_touchDeliveryPolicyServer;
}

- (void)setServiceServer:(id)a3
{
}

- (BKMousePointerServiceServer)serviceServer
{
  return self->_serviceServer;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (BKMousePointerAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setDeviceAvailabilityMonitor:(id)a3
{
}

- (BKMousePointerDeviceAvailabilityMonitor)deviceAvailabilityMonitor
{
  return self->_deviceAvailabilityMonitor;
}

- (void)setClientConnectionManager:(id)a3
{
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return self->_clientConnectionManager;
}

- (void)setLocalDefaults:(id)a3
{
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setDisplayController:(id)a3
{
}

- (BKDisplayController)displayController
{
  return self->_displayController;
}

- (void)setEventDeliveryManager:(id)a3
{
}

- (BKHIDEventDeliveryManager)eventDeliveryManager
{
  return self->_eventDeliveryManager;
}

- (void)setKeyboardEventProcessor:(id)a3
{
}

- (BKKeyboardHIDEventProcessor)keyboardEventProcessor
{
  return self->_keyboardEventProcessor;
}

- (void)setSmartCoverEventProcessor:(id)a3
{
}

- (BKSmartCoverHIDEventProcessor)smartCoverEventProcessor
{
  return self->_smartCoverEventProcessor;
}

- (void)setTouchPadManager:(id)a3
{
}

- (BKTouchPadManager)touchPadManager
{
  return self->_touchPadManager;
}

- (void)setOrientationManager:(id)a3
{
}

- (BKOrientationManager)orientationManager
{
  return self->_orientationManager;
}

- (void)setDisplayProvider:(id)a3
{
}

- (BKCADisplayProvider)displayProvider
{
  return self->_displayProvider;
}

@end