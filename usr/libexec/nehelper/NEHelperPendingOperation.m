@interface NEHelperPendingOperation
@end

@implementation NEHelperPendingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestMessage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

@end