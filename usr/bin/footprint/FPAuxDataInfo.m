@interface FPAuxDataInfo
@end

@implementation FPAuxDataInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end