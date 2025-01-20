@interface NESMSystemExtensionTerminationOperation
@end

@implementation NESMSystemExtensionTerminationOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end