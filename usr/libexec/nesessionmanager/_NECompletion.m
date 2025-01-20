@interface _NECompletion
@end

@implementation _NECompletion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end