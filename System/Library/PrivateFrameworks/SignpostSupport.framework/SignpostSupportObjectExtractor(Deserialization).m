@interface SignpostSupportObjectExtractor(Deserialization)
- (void)finishProcessingSerializedData;
@end

@implementation SignpostSupportObjectExtractor(Deserialization)

- (void)finishProcessingSerializedData
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Called 'processingComplete' on an already finished SignpostSupportObjectExtractor", v1, 2u);
}

@end