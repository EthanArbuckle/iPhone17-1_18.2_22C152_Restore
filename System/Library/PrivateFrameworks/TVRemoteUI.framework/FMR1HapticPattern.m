@interface FMR1HapticPattern
- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithDictionary:(id)a3 error:(id *)a4;
- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithEvents:(id)a3 parameterCurves:(id)a4 error:(id *)a5;
- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithEvents:(id)a3 parameters:(id)a4 error:(id *)a5;
@end

@implementation FMR1HapticPattern

- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithEvents:(id)a3 parameters:(id)a4 error:(id *)a5
{
  return (_TtC10TVRemoteUI17FMR1HapticPattern *)@objc FMR1HapticPattern.init(events:parameters:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, &lazy cache variable for type metadata for CHHapticDynamicParameter, 0x263F00580, (SEL *)&selRef_initWithEvents_parameters_error_);
}

- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithEvents:(id)a3 parameterCurves:(id)a4 error:(id *)a5
{
  return (_TtC10TVRemoteUI17FMR1HapticPattern *)@objc FMR1HapticPattern.init(events:parameters:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (unint64_t *)&lazy cache variable for type metadata for CHHapticParameterCurve, 0x263F005A0, (SEL *)&selRef_initWithEvents_parameterCurves_error_);
}

- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithDictionary:(id)a3 error:(id *)a4
{
  return (_TtC10TVRemoteUI17FMR1HapticPattern *)FMR1HapticPattern.init(dictionary:)();
}

- (_TtC10TVRemoteUI17FMR1HapticPattern)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  type metadata accessor for URL();
  MEMORY[0x270FA5388]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC10TVRemoteUI17FMR1HapticPattern *)FMR1HapticPattern.init(contentsOf:)((uint64_t)v5);
}

- (void).cxx_destruct
{
}

@end