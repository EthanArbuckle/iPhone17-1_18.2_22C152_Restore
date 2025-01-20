@interface _PILongExposureRegistrationResult
- ($FD18CD26FAB5729647810B74E671536E)extent;
- (VNImageHomographicAlignmentObservation)observation;
- (void)setExtent:(id *)a3;
- (void)setObservation:(id)a3;
@end

@implementation _PILongExposureRegistrationResult

- (void).cxx_destruct
{
}

- (void)setExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($FD18CD26FAB5729647810B74E671536E)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v3;
  return self;
}

- (void)setObservation:(id)a3
{
}

- (VNImageHomographicAlignmentObservation)observation
{
  return self->_observation;
}

@end