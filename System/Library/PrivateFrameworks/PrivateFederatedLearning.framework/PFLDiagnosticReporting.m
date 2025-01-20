@interface PFLDiagnosticReporting
+ (id)reportingStringForIdentifier:(id)a3;
@end

@implementation PFLDiagnosticReporting

+ (id)reportingStringForIdentifier:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    +[PFLDiagnosticReporting reportingStringForIdentifier:]();
  }
  return 0;
}

+ (void)reportingStringForIdentifier:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F0DC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "PFLDiagnosticReporting is being deprecated, please consult PFL team.", v0, 2u);
}

@end