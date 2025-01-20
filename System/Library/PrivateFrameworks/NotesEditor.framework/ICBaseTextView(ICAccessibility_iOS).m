@interface ICBaseTextView(ICAccessibility_iOS)
- (void)_icaxAddObservationsForCalculate;
@end

@implementation ICBaseTextView(ICAccessibility_iOS)

- (void)_icaxAddObservationsForCalculate
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__icaxResetCalculationErrorsForCalculateDocumentUpdate name:*MEMORY[0x263F5B070] object:0];
  [v3 addObserver:self selector:sel__icaxResetCalculationErrorsForCalculateDocumentUpdate name:*MEMORY[0x263F5B078] object:0];
}

@end