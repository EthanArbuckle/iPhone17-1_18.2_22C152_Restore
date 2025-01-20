void sub_1001B86C4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  [a1 accountAvailable];
  sub_10006C91C((void *)&_mh_execute_header, v1, v2, "Error removing nickname device, Account status - %d", v3, v4, v5, v6, 0);
}

void sub_1001B8740()
{
  sub_10006B57C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Invalid Cloud Info: %@", v1, 0xCu);
}

void sub_1001B87B4()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Error resetting cloud container: %@", v2, v3, v4, v5, v6);
}

void sub_1001B881C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = byte_100263F10;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isBuddyComplete: %i", (uint8_t *)v1, 8u);
}

void sub_1001B88A0(os_log_t log)
{
  if (byte_100263F11) {
    CFStringRef v1 = @"YES";
  }
  else {
    CFStringRef v1 = @"NO";
  }
  int v2 = 138543362;
  CFStringRef v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Unlocked since boot = %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1001B893C()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: Invalid reference to accountStatusDidChange", v2, v3, v4, v5, v6);
}

void sub_1001B8970()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: fetchKeyBlob Account manateeZone NOT Available ", v2, v3, v4, v5, v6);
}

void sub_1001B89A4()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: fetchKeyBlob failed because manatee status is not available", v2, v3, v4, v5, v6);
}

void sub_1001B89D8()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: Invalid reference to checkAccountStatusWithCompletionHandler", v2, v3, v4, v5, v6);
}

void sub_1001B8A0C()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: fetchAccessoryKeyBlob Account manateeZone NOT Available ", v2, v3, v4, v5, v6);
}

void sub_1001B8A40()
{
  sub_10006B5F0();
  sub_10006B588((void *)&_mh_execute_header, v0, v1, "Manatee: fetchAccessoryKeyBlob failed because manatee status is not available", v2, v3, v4, v5, v6);
}

void sub_1001B8A74()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: fetchAccessoryKeyBlob CKErrorServiceUnavailable/RateLimited, error: %@", v2, v3, v4, v5, v6);
}

void sub_1001B8ADC()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: fetchAccessoryKeyBlob delete record cache, error: %@", v2, v3, v4, v5, v6);
}

void sub_1001B8B44()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: fetchAccessoryKeyBlob failed to save in device manager: %@", v2, v3, v4, v5, v6);
}

void sub_1001B8BAC()
{
  sub_10006B57C();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Error querying master key record - %@, retry count - %lu");
}

void sub_1001B8C24()
{
  sub_10006B57C();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Updating master key failed with error %@, retry count = %lu");
}

void sub_1001B8C98()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error no master key record/zone found, create zone/record and write data - %@", v2, v3, v4, v5, v6);
}

void sub_1001B8D00()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Cannot updateCloudKitAccessoryZone with %@, Account not active", v2, v3, v4, v5, v6);
}

void sub_1001B8D68()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error querying record - %@", v2, v3, v4, v5, v6);
}

void sub_1001B8DD0()
{
  sub_100078DCC(__stack_chk_guard);
  sub_100078DB4();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Error Saving the modified record [%@] - %@");
}

void sub_1001B8E38()
{
  sub_100078DCC(__stack_chk_guard);
  sub_100078DB4();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Error caching the modified record in services layer [%@] - %@");
}

void sub_1001B8EA0()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error saving the modified record exceeded retry count - %@", v2, v3, v4, v5, v6);
}

void sub_1001B8F08()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error saving the modified record network error - %@", v2, v3, v4, v5, v6);
}

void sub_1001B8F70()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error no record/zone found, create zone/record and write data - %@", v2, v3, v4, v5, v6);
}

void sub_1001B8FD8()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error saving the modified record - %@", v2, v3, v4, v5, v6);
}

void sub_1001B9040()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Error writing record exceeded retry count - %@", v2, v3, v4, v5, v6);
}

void sub_1001B90A8()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: writeAccessoryBlob failed with network error %@ ", v2, v3, v4, v5, v6);
}

void sub_1001B9110()
{
  sub_100078DCC(__stack_chk_guard);
  sub_100078DB4();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Error caching the new record in services layer [%@] - %@");
}

void sub_1001B9178()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: delete cloudkit zone, error: %@", v2, v3, v4, v5, v6);
}

void sub_1001B91E0()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Found Duplicate SubscriptionID: %@ ", v2, v3, v4, v5, v6);
}

void sub_1001B9248()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: ERROR Saving Subscription: %@ ", v2, v3, v4, v5, v6);
}

void sub_1001B92B0()
{
  sub_10006B57C();
  sub_10006C71C((void *)&_mh_execute_header, v0, v1, "Manatee: Different subscription found - %@", v2, v3, v4, v5, v6);
}

void sub_1001B9318()
{
  sub_100078DCC(__stack_chk_guard);
  sub_100078DB4();
  sub_10006B610((void *)&_mh_execute_header, v0, v1, "Manatee: Error fetching subscription with ID (%@): %@");
}

void sub_1001B9380()
{
  sub_10006B57C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "XPC client connection: %@", v1, 0xCu);
}

void sub_1001B93F4()
{
  sub_10006B57C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "XPC error: %@", v1, 0xCu);
}

void sub_1001B9468()
{
  sub_10006B57C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unexpected XPC event: %@", v1, 0xCu);
}

void sub_1001B94DC()
{
  sub_10006B57C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending XPC message: %@", v1, 0xCu);
}

uint64_t static CharacterSet.illegalCharacters.getter()
{
  return static CharacterSet.illegalCharacters.getter();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t static CustomNSError.errorDomain.getter()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t CustomNSError.errorCode.getter()
{
  return CustomNSError.errorCode.getter();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return _BridgedStoredNSError.userInfo.getter();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.description.getter()
{
  return URL.description.getter();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.appendPathComponent(_:)(Swift::String a1)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

uint64_t Data._Representation.subscript.setter()
{
  return Data._Representation.subscript.setter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Data.subdata(in:)()
{
  return Data.subdata(in:)();
}

Swift::UInt8_optional __swiftcall Data.Iterator.next()()
{
  return (Swift::UInt8_optional)Data.Iterator.next()();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t related decl 'e' for CKErrorCode.description.getter()
{
  return related decl 'e' for CKErrorCode.description.getter();
}

uint64_t related decl 'e' for CKErrorCode.serverRecord.getter()
{
  return related decl 'e' for CKErrorCode.serverRecord.getter();
}

uint64_t related decl 'e' for CKErrorCode.retryAfterSeconds.getter()
{
  return related decl 'e' for CKErrorCode.retryAfterSeconds.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t Character.write<A>(to:)()
{
  return Character.write<A>(to:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init(utf16CodeUnits:count:)()
{
  return String.init(utf16CodeUnits:count:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.distance(from:to:)()
{
  return String.distance(from:to:)();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return String.UTF16View._foreignCount()();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.hashValue.getter()
{
  return String.hashValue.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

CKRecordID __swiftcall CKRecordID.init(recordName:zoneID:)(Swift::String recordName, CKRecordZoneID zoneID)
{
  return (CKRecordID)CKRecordID.init(recordName:zoneID:)(recordName._countAndFlagsBits, recordName._object, zoneID.super.isa);
}

uint64_t NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

CKRecordZoneID __swiftcall CKRecordZoneID.init(zoneName:ownerName:)(Swift::String zoneName, Swift::String ownerName)
{
  return (CKRecordZoneID)CKRecordZoneID.init(zoneName:ownerName:)(zoneName._countAndFlagsBits, zoneName._object, ownerName._countAndFlagsBits, ownerName._object);
}

uint64_t CKQueryOperation.queryResultBlock.setter()
{
  return CKQueryOperation.queryResultBlock.setter();
}

uint64_t CKQueryOperation.recordMatchedBlock.setter()
{
  return CKQueryOperation.recordMatchedBlock.setter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t OS_dispatch_source.isCancelled.getter()
{
  return OS_dispatch_source.isCancelled.getter();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

CKDatabaseSubscription __swiftcall CKDatabaseSubscription.init(subscriptionID:)(Swift::String subscriptionID)
{
  return (CKDatabaseSubscription)CKDatabaseSubscription.init(subscriptionID:)(subscriptionID._countAndFlagsBits, subscriptionID._object);
}

uint64_t CKRecordKeyValueSetting.subscript.getter()
{
  return CKRecordKeyValueSetting.subscript.getter();
}

{
  return CKRecordKeyValueSetting.subscript.getter();
}

uint64_t CKRecordKeyValueSetting.subscript.setter()
{
  return CKRecordKeyValueSetting.subscript.setter();
}

uint64_t CKModifyRecordsOperation.modifyRecordsResultBlock.setter()
{
  return CKModifyRecordsOperation.modifyRecordsResultBlock.setter();
}

CKModifyRecordsOperation __swiftcall CKModifyRecordsOperation.init(recordsToSave:recordIDsToDelete:)(Swift::OpaquePointer_optional recordsToSave, Swift::OpaquePointer_optional recordIDsToDelete)
{
  return (CKModifyRecordsOperation)CKModifyRecordsOperation.init(recordsToSave:recordIDsToDelete:)(recordsToSave.value._rawValue, *(void *)&recordsToSave.is_nil, recordIDsToDelete.value._rawValue, *(void *)&recordIDsToDelete.is_nil);
}

uint64_t CKModifyRecordsOperation.perRecordSaveBlock.setter()
{
  return CKModifyRecordsOperation.perRecordSaveBlock.setter();
}

uint64_t CKModifyRecordsOperation.perRecordDeleteBlock.setter()
{
  return CKModifyRecordsOperation.perRecordDeleteBlock.setter();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t CKModifyRecordZonesOperation.modifyRecordZonesResultBlock.setter()
{
  return CKModifyRecordZonesOperation.modifyRecordZonesResultBlock.setter();
}

CKModifyRecordZonesOperation __swiftcall CKModifyRecordZonesOperation.init(recordZonesToSave:recordZoneIDsToDelete:)(Swift::OpaquePointer_optional recordZonesToSave, Swift::OpaquePointer_optional recordZoneIDsToDelete)
{
  return (CKModifyRecordZonesOperation)CKModifyRecordZonesOperation.init(recordZonesToSave:recordZoneIDsToDelete:)(recordZonesToSave.value._rawValue, *(void *)&recordZonesToSave.is_nil, recordZoneIDsToDelete.value._rawValue, *(void *)&recordZoneIDsToDelete.is_nil);
}

uint64_t CKModifySubscriptionsOperation.modifySubscriptionsResultBlock.setter()
{
  return CKModifySubscriptionsOperation.modifySubscriptionsResultBlock.setter();
}

CKModifySubscriptionsOperation __swiftcall CKModifySubscriptionsOperation.init(subscriptionsToSave:subscriptionIDsToDelete:)(Swift::OpaquePointer_optional subscriptionsToSave, Swift::OpaquePointer_optional subscriptionIDsToDelete)
{
  return (CKModifySubscriptionsOperation)CKModifySubscriptionsOperation.init(subscriptionsToSave:subscriptionIDsToDelete:)(subscriptionsToSave.value._rawValue, *(void *)&subscriptionsToSave.is_nil, subscriptionIDsToDelete.value._rawValue, *(void *)&subscriptionIDsToDelete.is_nil);
}

uint64_t CKFetchDatabaseChangesOperation.fetchDatabaseChangesResultBlock.setter()
{
  return CKFetchDatabaseChangesOperation.fetchDatabaseChangesResultBlock.setter();
}

uint64_t CKFetchRecordZoneChangesOperation.fetchRecordZoneChangesResultBlock.setter()
{
  return CKFetchRecordZoneChangesOperation.fetchRecordZoneChangesResultBlock.setter();
}

uint64_t CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter()
{
  return CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter();
}

CKFetchRecordZoneChangesOperation __swiftcall CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(Swift::OpaquePointer_optional recordZoneIDs, Swift::OpaquePointer_optional configurationsByRecordZoneID)
{
  return (CKFetchRecordZoneChangesOperation)CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(recordZoneIDs.value._rawValue, *(void *)&recordZoneIDs.is_nil, configurationsByRecordZoneID.value._rawValue, *(void *)&configurationsByRecordZoneID.is_nil);
}

uint64_t CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter()
{
  return CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter();
}

uint64_t CKFetchRecordZoneChangesOperation.recordWithIDWasDeletedBlock.setter()
{
  return CKFetchRecordZoneChangesOperation.recordWithIDWasDeletedBlock.setter();
}

CKQuery __swiftcall CKQuery.init(recordType:predicate:)(Swift::String recordType, NSPredicate *predicate)
{
  return (CKQuery)CKQuery.init(recordType:predicate:)(recordType._countAndFlagsBits, recordType._object, predicate);
}

CKRecord __swiftcall CKRecord.init(recordType:recordID:)(Swift::String recordType, CKRecordID recordID)
{
  return (CKRecord)CKRecord.init(recordType:recordID:)(recordType._countAndFlagsBits, recordType._object, recordID.super.isa);
}

uint64_t CKRecord.recordType.getter()
{
  return CKRecord.recordType.getter();
}

uint64_t CKRecord.changedKeys()()
{
  return CKRecord.changedKeys()();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t NSScanner.currentIndex.getter()
{
  return NSScanner.currentIndex.getter();
}

Swift::String_optional __swiftcall NSScanner.scanCharacter()()
{
  uint64_t v0 = NSScanner.scanCharacter()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t type metadata accessor for NSScanner.NumberRepresentation()
{
  return type metadata accessor for NSScanner.NumberRepresentation();
}

uint64_t NSScanner.scanInt(representation:)()
{
  return NSScanner.scanInt(representation:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Unicode.Scalar.UTF16View.subscript.getter()
{
  return Unicode.Scalar.UTF16View.subscript.getter();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return _AFDeviceSupportsSystemAssistantExperience();
}

uint64_t BTErrorF()
{
  return _BTErrorF();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return _CFDictionaryGetCFDataOfLength();
}

uint64_t CFDictionaryGetDouble()
{
  return _CFDictionaryGetDouble();
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return _CFDictionaryGetInt64Ranged();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

uint64_t CFDictionaryGetTypedValue()
{
  return _CFDictionaryGetTypedValue();
}

CFTypeID CFErrorGetTypeID(void)
{
  return _CFErrorGetTypeID();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t CFPrefs_CopyKeys()
{
  return _CFPrefs_CopyKeys();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return _CFPrefs_CopyTypedValue();
}

uint64_t CFPrefs_GetDouble()
{
  return _CFPrefs_GetDouble();
}

uint64_t CFPrefs_GetInt64()
{
  return _CFPrefs_GetInt64();
}

uint64_t CFPrefs_RemoveValue()
{
  return _CFPrefs_RemoveValue();
}

uint64_t CFPrefs_SetValue()
{
  return _CFPrefs_SetValue();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

uint64_t CKErrorIsCode()
{
  return _CKErrorIsCode();
}

uint64_t CKStringFromAccountStatus()
{
  return _CKStringFromAccountStatus();
}

uint64_t CUDescriptionWithLevel()
{
  return _CUDescriptionWithLevel();
}

uint64_t CUDispatchTimerSet()
{
  return _CUDispatchTimerSet();
}

uint64_t CULocalizedStringEx()
{
  return _CULocalizedStringEx();
}

uint64_t CUMetricsLog()
{
  return _CUMetricsLog();
}

uint64_t CUMetricsLogEx()
{
  return _CUMetricsLogEx();
}

uint64_t CUPrintErrorCode()
{
  return _CUPrintErrorCode();
}

uint64_t CUPrintFlags32()
{
  return _CUPrintFlags32();
}

uint64_t CUPrintNSDataAddress()
{
  return _CUPrintNSDataAddress();
}

uint64_t CUPrintNSDataHex()
{
  return _CUPrintNSDataHex();
}

uint64_t CUPrintNSError()
{
  return _CUPrintNSError();
}

uint64_t CUPrintXPC()
{
  return _CUPrintXPC();
}

uint64_t CUXPCDecodeNSData()
{
  return _CUXPCDecodeNSData();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return _CUXPCDecodeNSErrorIfNeeded();
}

uint64_t CUXPCDecodeNSString()
{
  return _CUXPCDecodeNSString();
}

uint64_t CUXPCDecodeObject()
{
  return _CUXPCDecodeObject();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return _CUXPCDecodeUInt64RangedEx();
}

uint64_t GestaltCopyAnswer()
{
  return _GestaltCopyAnswer();
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t IDSCopyForDevice()
{
  return _IDSCopyForDevice();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return _IDSCopyLocalDeviceUniqueID();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return _MRAVOutputContextCopyOutputDevices();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return _MRAVOutputContextGetSharedAudioPresentationContext();
}

uint64_t MRAVOutputContextGetSharedSystemAudioContext()
{
  return _MRAVOutputContextGetSharedSystemAudioContext();
}

uint64_t MRAVOutputContextSetOutputDevice()
{
  return _MRAVOutputContextSetOutputDevice();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return _MRAVOutputDeviceCopyName();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return _MRAVOutputDeviceCopyUniqueIdentifier();
}

uint64_t MRAVOutputDeviceGetSubtype()
{
  return _MRAVOutputDeviceGetSubtype();
}

uint64_t MRAVOutputDeviceGetType()
{
  return _MRAVOutputDeviceGetType();
}

uint64_t MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback()
{
  return _MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
}

uint64_t MRAVRoutingDiscoverySessionCreate()
{
  return _MRAVRoutingDiscoverySessionCreate();
}

uint64_t MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback()
{
  return _MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
}

uint64_t MRAVRoutingDiscoverySessionSetDiscoveryMode()
{
  return _MRAVRoutingDiscoverySessionSetDiscoveryMode();
}

uint64_t MRMediaRemoteSetWantsRouteChangeNotifications()
{
  return _MRMediaRemoteSetWantsRouteChangeNotifications();
}

uint64_t NSAppendPrintF()
{
  return _NSAppendPrintF();
}

uint64_t NSAppendPrintF_safe()
{
  return _NSAppendPrintF_safe();
}

uint64_t NSDataWithHex()
{
  return _NSDataWithHex();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return _NSDecodeSInt64RangedIfPresent();
}

uint64_t NSDictionaryGetNSNumber()
{
  return _NSDictionaryGetNSNumber();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
}

uint64_t NSErrorWithOSStatusF()
{
  return _NSErrorWithOSStatusF();
}

uint64_t NSPrintF()
{
  return _NSPrintF();
}

uint64_t NSPrintF_safe()
{
  return _NSPrintF_safe();
}

uint64_t NSStringWithMACAddress()
{
  return _NSStringWithMACAddress();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OPACKDecodeData()
{
  return _OPACKDecodeData();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t RandomBytes()
{
  return _RandomBytes();
}

uint64_t SFErrorF()
{
  return _SFErrorF();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t SecondsToUpTicks()
{
  return _SecondsToUpTicks();
}

uint64_t UpTicksToMilliseconds()
{
  return _UpTicksToMilliseconds();
}

uint64_t UpTicksToSeconds()
{
  return _UpTicksToSeconds();
}

uint64_t UpTicksToSecondsF()
{
  return _UpTicksToSecondsF();
}

uint64_t _AXSSpatialAudioHeadTracking()
{
  return __AXSSpatialAudioHeadTracking();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return __CFXPCCreateXPCMessageWithCFObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _IDSStringFromIDSRegistrationStatus()
{
  return __IDSStringFromIDSRegistrationStatus();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

{
}

{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return _ccaes_ecb_decrypt_mode();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return _ccaes_ecb_encrypt_mode();
}

uint64_t ccecb_one_shot()
{
  return _ccecb_one_shot();
}

int close(int a1)
{
  return _close(a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int isxdigit(int _c)
{
  return _isxdigit(_c);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t stringForCKErrorCode()
{
  return _stringForCKErrorCode();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return _xpc_connection_copy_invalidation_reason();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return _xpc_copy_code_signing_identity_for_token();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

uint64_t xpc_create_with_format()
{
  return _xpc_create_with_format();
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_CPAddressMapping(void *a1, const char *a2, ...)
{
  return _[a1 CPAddressMapping];
}

id objc_msgSend_CloudDevice(void *a1, const char *a2, ...)
{
  return _[a1 CloudDevice];
}

id objc_msgSend_CloudDeviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 CloudDeviceAddress];
}

id objc_msgSend_Discoverability(void *a1, const char *a2, ...)
{
  return _[a1 Discoverability];
}

id objc_msgSend_SRConnectedSetCount(void *a1, const char *a2, ...)
{
  return _[a1 SRConnectedSetCount];
}

id objc_msgSend_Signals(void *a1, const char *a2, ...)
{
  return _[a1 Signals];
}

id objc_msgSend_TUCallMap(void *a1, const char *a2, ...)
{
  return _[a1 TUCallMap];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__TUMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _TUMonitorEnsureStarted];
}

id objc_msgSend__TUMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _TUMonitorEnsureStopped];
}

id objc_msgSend__aaControllerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _aaControllerEnsureStarted];
}

id objc_msgSend__aaControllerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _aaControllerEnsureStopped];
}

id objc_msgSend__aacpConnectedCheck_(void *a1, const char *a2, ...)
{
  return [_aacpConnectedCheck:];
}

id objc_msgSend__accessoryDeviceFound_withChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_accessoryDeviceFound:withChange:");
}

id objc_msgSend__accessoryDevicePerformActionsOnChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_accessoryDevicePerformActionsOnChange:");
}

id objc_msgSend__accessoryDeviceRemoveOffListeningModeIfNeeded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_accessoryDeviceRemoveOffListeningModeIfNeeded:");
}

id objc_msgSend__accessoryDeviceUpdateCloudRecord_config_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_accessoryDeviceUpdateCloudRecord:config:");
}

id objc_msgSend__activate_(void *a1, const char *a2, ...)
{
  return [a1 _activate:];
}

id objc_msgSend__activateCDSession(void *a1, const char *a2, ...)
{
  return _[a1 _activateCDSession];
}

id objc_msgSend__activateDirect_(void *a1, const char *a2, ...)
{
  return [a1 _activateDirect:];
}

id objc_msgSend__activateXPC_reactivate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_activateXPC:reactivate:");
}

id objc_msgSend__activityMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _activityMonitorEnsureStarted];
}

id objc_msgSend__activityMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _activityMonitorEnsureStopped];
}

id objc_msgSend__anyPairedDeviceSupportsSmartRouting(void *a1, const char *a2, ...)
{
  return _[a1 _anyPairedDeviceSupportsSmartRouting];
}

id objc_msgSend__arbitrationTimeout_withScore_(void *a1, const char *a2, ...)
{
  return [a1 _arbitrationTimeout:withScore:];
}

id objc_msgSend__asyncAudioSessionDuckWithLevel_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_asyncAudioSessionDuckWithLevel:completion:");
}

id objc_msgSend__audioSessionEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _audioSessionEnsureStarted];
}

id objc_msgSend__audioSessionEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _audioSessionEnsureStopped];
}

id objc_msgSend__bluetoothProductDefaultAsset_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bluetoothProductDefaultAsset:");
}

id objc_msgSend__bluetoothProductIDNoEarDetect_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bluetoothProductIDNoEarDetect:");
}

id objc_msgSend__bluetoothProductIDNoUTP_(void *a1, const char *a2, ...)
{
  return [a1 _bluetoothProductIDNoUTP:];
}

id objc_msgSend__bluetoothProductIDToAsset_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bluetoothProductIDToAsset:");
}

id objc_msgSend__bluetoothProductIDToCaseAsset_andAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bluetoothProductIDToCaseAsset:andAddress:");
}

id objc_msgSend__bluetoothProductIDToColorAsset_withColor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bluetoothProductIDToColorAsset:withColor:");
}

id objc_msgSend__budSwapDetectionStartTimer_(void *a1, const char *a2, ...)
{
  return [a1 _budSwapDetectionStartTimer:];
}

id objc_msgSend__cacheBudswapInfo_(void *a1, const char *a2, ...)
{
  return [a1 _cacheBudswapInfo:];
}

id objc_msgSend__cacheInfo_andAddress_andName_andVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_cacheInfo:andAddress:andName:andVersion:");
}

id objc_msgSend__calibrateDuckingLevelForVolumeLevel_(void *a1, const char *a2, ...)
{
  return [a1 _calibrateDuckingLevelForVolumeLevel:];
}

id objc_msgSend__callMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _callMonitorEnsureStarted];
}

id objc_msgSend__callMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _callMonitorEnsureStopped];
}

id objc_msgSend__cancelInUseBannerForCallTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelInUseBannerForCallTimer];
}

id objc_msgSend__cancelRingtoneTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelRingtoneTimer];
}

id objc_msgSend__cancelTriangleRecoveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTriangleRecoveryTimer];
}

id objc_msgSend__cbConnectedDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbConnectedDiscoveryEnsureStarted];
}

id objc_msgSend__cbConnectedDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbConnectedDiscoveryEnsureStopped];
}

id objc_msgSend__cbControllerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbControllerEnsureStarted];
}

id objc_msgSend__cbControllerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbControllerEnsureStopped];
}

id objc_msgSend__cbDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbDiscoveryEnsureStarted];
}

id objc_msgSend__cbDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbDiscoveryEnsureStopped];
}

id objc_msgSend__cdSessionEnsureActivated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_cdSessionEnsureActivated:");
}

id objc_msgSend__cdSessionEnsureDeactivated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_cdSessionEnsureDeactivated:)];
}

id objc_msgSend__checkIfPairedCompanionDeviceSupportsSmartRouting(void *a1, const char *a2, ...)
{
  return _[a1 _checkIfPairedCompanionDeviceSupportsSmartRouting];
}

id objc_msgSend__checkTickswithinWindow_withWindow_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkTickswithinWindow:withWindow:");
}

id objc_msgSend__checkTriangleRecovery(void *a1, const char *a2, ...)
{
  return _[a1 _checkTriangleRecovery];
}

id objc_msgSend__checkValidBatteryValue_(void *a1, const char *a2, ...)
{
  return [a1 _checkValidBatteryValue:];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return _[a1 _cleanup];
}

id objc_msgSend__clearCallSession(void *a1, const char *a2, ...)
{
  return _[a1 _clearCallSession];
}

id objc_msgSend__cloudSyncEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cloudSyncEnsureStarted];
}

id objc_msgSend__cloudSyncEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cloudSyncEnsureStopped];
}

id objc_msgSend__connectedDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 _connectedDeviceLost:];
}

id objc_msgSend__connectedDeviceMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _connectedDeviceMonitorEnsureStarted];
}

id objc_msgSend__connectedDeviceMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _connectedDeviceMonitorEnsureStopped];
}

id objc_msgSend__contextSignalUpdated_withFusedState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_contextSignalUpdated:withFusedState:");
}

id objc_msgSend__conversationDetectMessageReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_conversationDetectMessageReceived:fromDevice:");
}

id objc_msgSend__conversationDetectMessageReceived_fromDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_conversationDetectMessageReceived:fromDeviceIdentifier:");
}

id objc_msgSend__createBannerSessionMuteActionForIOS_auditToken_appName_appBundleID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:");
}

id objc_msgSend__deregisterFromAVAudioSessionSpeechDetectionStyleChanges(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVAudioSessionSpeechDetectionStyleChanges];
}

id objc_msgSend__deregisterFromAVSystemControllerDeathNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVSystemControllerDeathNotifications];
}

id objc_msgSend__deregisterFromAVSystemControllerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVSystemControllerStateNotifications];
}

id objc_msgSend__deregisterFromAudioSessionResetNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAudioSessionResetNotifications];
}

id objc_msgSend__deregisterFromWirelessSplitterStateChanges(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromWirelessSplitterStateChanges];
}

id objc_msgSend__descriptionWithLevel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_descriptionWithLevel:");
}

id objc_msgSend__deviceSupportsHijackV2_withDevice_(void *a1, const char *a2, ...)
{
  return [a1 _deviceSupportsHijackV2:withDevice:];
}

id objc_msgSend__diagnosticControlShareAudioBanner(void *a1, const char *a2, ...)
{
  return _[a1 _diagnosticControlShareAudioBanner];
}

id objc_msgSend__disconnectOtherTipiDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_disconnectOtherTipiDevice:");
}

id objc_msgSend__duckingLevelForCoefficients_volume_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_duckingLevelForCoefficients:volume:")];
}

id objc_msgSend__ensureStartedContextMonitorWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_ensureStartedContextMonitorWithCompletion:");
}

id objc_msgSend__ensureXPCStarted(void *a1, const char *a2, ...)
{
  return _[a1 _ensureXPCStarted];
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 _entitledAndReturnError:];
}

id objc_msgSend__evaluatorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _evaluatorEnsureStarted];
}

id objc_msgSend__evaluatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _evaluatorEnsureStopped];
}

id objc_msgSend__evaluatorRun(void *a1, const char *a2, ...)
{
  return _[a1 _evaluatorRun];
}

id objc_msgSend__evaluatorRunInUseBanner_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_evaluatorRunInUseBanner:");
}

id objc_msgSend__evaluatorRunTipiElection_nearbyInfoDevicesMap_localScore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:");
}

id objc_msgSend__feedbackCampainIdentifierForCampain_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_feedbackCampainIdentifierForCampain:");
}

id objc_msgSend__feedbackCampainLocalizedTitleForCampain_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_feedbackCampainLocalizedTitleForCampain:");
}

id objc_msgSend__fetchAccessoryKeyBlob_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fetchAccessoryKeyBlob:");
}

id objc_msgSend__fetchArrayOfCloudDevicesForPeripheral_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fetchArrayOfCloudDevicesForPeripheral:");
}

id objc_msgSend__fetchCloudPairingIdentifierForPeripheral_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fetchCloudPairingIdentifierForPeripheral:");
}

id objc_msgSend__fetchKeyBlob_(void *a1, const char *a2, ...)
{
  return [a1 _fetchKeyBlob:];
}

id objc_msgSend__fileRadar_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fileRadar:");
}

id objc_msgSend__findActiveWxDevice(void *a1, const char *a2, ...)
{
  return _[a1 _findActiveWxDevice];
}

id objc_msgSend__generateContextChangedFlags_spl_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_generateContextChangedFlags:spl:");
}

id objc_msgSend__getActiveNearbyWxAdress(void *a1, const char *a2, ...)
{
  return _[a1 _getActiveNearbyWxAdress];
}

id objc_msgSend__getBoolPreferencesForKey_(void *a1, const char *a2, ...)
{
  return [a1 _getBoolPreferencesForKey:];
}

id objc_msgSend__getCDTunings_FromData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getCDTunings:FromData:");
}

id objc_msgSend__getCurrentAudioOwner(void *a1, const char *a2, ...)
{
  return _[a1 _getCurrentAudioOwner];
}

id objc_msgSend__getCurrentRoute(void *a1, const char *a2, ...)
{
  return _[a1 _getCurrentRoute];
}

id objc_msgSend__getIDSDeviceFromBtAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getIDSDeviceFromBtAddress:");
}

id objc_msgSend__getInEarSrWxDevice(void *a1, const char *a2, ...)
{
  return _[a1 _getInEarSrWxDevice];
}

id objc_msgSend__getJsonStringFromDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getJsonStringFromDictionary:");
}

id objc_msgSend__getPauseMessage(void *a1, const char *a2, ...)
{
  return _[a1 _getPauseMessage];
}

id objc_msgSend__getResetMessage_(void *a1, const char *a2, ...)
{
  return [a1 _getResetMessage:];
}

id objc_msgSend__getRssiNearby_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getRssiNearby:");
}

id objc_msgSend__getSignalTypeFromData_signal_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getSignalTypeFromData:signal:")];
}

id objc_msgSend__getWxChipVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getWxChipVersion:");
}

id objc_msgSend__getWxColorCode_(void *a1, const char *a2, ...)
{
  return [a1 _getWxColorCode:];
}

id objc_msgSend__getWxFWVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getWxFWVersion:");
}

id objc_msgSend__getWxProductID_(void *a1, const char *a2, ...)
{
  return [a1 _getWxProductID:];
}

id objc_msgSend__handleHRMSessionChanged_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleHRMSessionChanged:");
}

id objc_msgSend__handleHijackBlockingwithDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleHijackBlockingwithDevice:");
}

id objc_msgSend__handlePairedWatchStatusDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _handlePairedWatchStatusDidChange];
}

id objc_msgSend__handlePhoneOwnershipTriangleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _handlePhoneOwnershipTriangleTimer];
}

id objc_msgSend__handleProactiveRoutingRouteCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleProactiveRoutingRouteCheck:");
}

id objc_msgSend__handleSessionEnded_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSessionEnded:error:");
}

id objc_msgSend__handleSmartRoutingDisabled_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSmartRoutingDisabled:");
}

id objc_msgSend__hijackBackoffReset_withReason_(void *a1, const char *a2, ...)
{
  return [a1 _hijackBackoffReset:withReason:];
}

id objc_msgSend__hijackBlockingModeChangedFromClient_mode_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_hijackBlockingModeChangedFromClient:mode:completion:");
}

id objc_msgSend__iPhoneScreenOnPowerEvent(void *a1, const char *a2, ...)
{
  return _[a1 _iPhoneScreenOnPowerEvent];
}

id objc_msgSend__idsScheduleUpdateIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _idsScheduleUpdateIdentities];
}

id objc_msgSend__inCaseLidClosed_(void *a1, const char *a2, ...)
{
  return [a1 _inCaseLidClosed:];
}

id objc_msgSend__inEarConnectedCheck_(void *a1, const char *a2, ...)
{
  return [a1 _inEarConnectedCheck:];
}

id objc_msgSend__inEarNearbyCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_inEarNearbyCheck:");
}

id objc_msgSend__interrupted(void *a1, const char *a2, ...)
{
  return _[a1 _interrupted];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return _[a1 _invalidate];
}

id objc_msgSend__invalidateCDSession(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateCDSession];
}

id objc_msgSend__invalidateDirect(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateDirect];
}

id objc_msgSend__invalidateMuteBanner(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateMuteBanner];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return _[a1 _invalidated];
}

id objc_msgSend__isAddDeviceToBackoffDueToDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 _isAddDeviceToBackoffDueToDisconnect];
}

id objc_msgSend__isAnyConnectedWxInEarCheck(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyConnectedWxInEarCheck];
}

id objc_msgSend__isAnyHRMEnabledDeviceConnected(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyHRMEnabledDeviceConnected];
}

id objc_msgSend__isConnectionTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 _isConnectionTipiv2];
}

id objc_msgSend__isDevicePairedCheck_(void *a1, const char *a2, ...)
{
  return [a1 _isDevicePairedCheck:];
}

id objc_msgSend__isEligibleForPreemptiveBanner_firstPreemptiveBanner_inEarState_srDeviceCount_audioState_inAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:");
}

id objc_msgSend__isEligibleForTipiV2_firstDeviceTipiScore_secondDeviceTipiScore_currentDeviceScore_sourceDeviceCount_isOnDemandConnect_address_lastConnectedHost_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:sourceDeviceCount:isOnDemandConnect:address:lastConnectedHost:");
}

id objc_msgSend__isForceRejectPipe(void *a1, const char *a2, ...)
{
  return _[a1 _isForceRejectPipe];
}

id objc_msgSend__isForceTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 _isForceTipiv2];
}

id objc_msgSend__isInEarDetectionDisabled_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isInEarDetectionDisabled:");
}

id objc_msgSend__isInEarToOutOfEar_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isInEarToOutOfEar:");
}

id objc_msgSend__isInHijackBlockingMode(void *a1, const char *a2, ...)
{
  return _[a1 _isInHijackBlockingMode];
}

id objc_msgSend__isInTipi(void *a1, const char *a2, ...)
{
  return _[a1 _isInTipi];
}

id objc_msgSend__isMagnetConnectedDeviceforConnectionCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isMagnetConnectedDeviceforConnectionCheck:");
}

id objc_msgSend__isMagnetConnectedDeviceforTipiHealingCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isMagnetConnectedDeviceforTipiHealingCheck:");
}

id objc_msgSend__isManualConnection_(void *a1, const char *a2, ...)
{
  return [a1 _isManualConnection:];
}

id objc_msgSend__isMyAddress_(void *a1, const char *a2, ...)
{
  return [a1 _isMyAddress:];
}

id objc_msgSend__isOnDemandConnectInProgress(void *a1, const char *a2, ...)
{
  return _[a1 _isOnDemandConnectInProgress];
}

id objc_msgSend__isOtherTipiDeviceBeforeTrain_withIOS_withMacOS_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:");
}

id objc_msgSend__isPhoneCall_(void *a1, const char *a2, ...)
{
  return [a1 _isPhoneCall:];
}

id objc_msgSend__isReceivedLegacyTipiConnect_(void *a1, const char *a2, ...)
{
  return [a1 _isReceivedLegacyTipiConnect:];
}

id objc_msgSend__isSmartRoutingCapableDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isSmartRoutingCapableDevice:");
}

id objc_msgSend__languageChangeMonitoringEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _languageChangeMonitoringEnsureStarted];
}

id objc_msgSend__languageChangeMonitoringEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _languageChangeMonitoringEnsureStopped];
}

id objc_msgSend__lastConnectIsWatchCheck_(void *a1, const char *a2, ...)
{
  return [a1 _lastConnectIsWatchCheck:];
}

id objc_msgSend__loadDeviceRecordForDevice_(void *a1, const char *a2, ...)
{
  return [a1 _loadDeviceRecordForDevice:];
}

id objc_msgSend__logEvalError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logEvalError:");
}

id objc_msgSend__logEvalWxError_withError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logEvalWxError:withError:");
}

id objc_msgSend__logPreemptiveBannerEvalError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logPreemptiveBannerEvalError:");
}

id objc_msgSend__lowBatteryClearSFDevice_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_lowBatteryClearSFDevice:reason:");
}

id objc_msgSend__lowBatteryDeviceFound_(void *a1, const char *a2, ...)
{
  return [a1 _lowBatteryDeviceFound:];
}

id objc_msgSend__lowBatteryDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 _lowBatteryDeviceLost:];
}

id objc_msgSend__lowBatteryLoad(void *a1, const char *a2, ...)
{
  return _[a1 _lowBatteryLoad];
}

id objc_msgSend__lowBatteryReset(void *a1, const char *a2, ...)
{
  return _[a1 _lowBatteryReset];
}

id objc_msgSend__lowBatterySave_(void *a1, const char *a2, ...)
{
  return [a1 _lowBatterySave:];
}

id objc_msgSend__lowBatteryShowAlertWithLowBatteryDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_lowBatteryShowAlertWithLowBatteryDevice:");
}

id objc_msgSend__lowBatteryTrackSFDevice_batteryLevel_batteryType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_lowBatteryTrackSFDevice:batteryLevel:batteryType:");
}

id objc_msgSend__lowBatteryUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _lowBatteryUpdate];
}

id objc_msgSend__lowestBatteryInfoForCBDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_lowestBatteryInfoForCBDevice:");
}

id objc_msgSend__lowestBatteryInfoForSFDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_lowestBatteryInfoForSFDevice:");
}

id objc_msgSend__mediaRouteDiscoveryStarted(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteDiscoveryStarted];
}

id objc_msgSend__mediaRouteDiscoveryStopped(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteDiscoveryStopped];
}

id objc_msgSend__mediaRouteHijackResponseHandlerFor_allowedToHijack_withReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:");
}

id objc_msgSend__mediaRouteHijackWithAudioScore_wxAddress_andAudioResponseID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:");
}

id objc_msgSend__mediaRouteMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorEnsureStarted];
}

id objc_msgSend__mediaRouteMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorEnsureStopped];
}

id objc_msgSend__mediaRouteMonitorSpeakRoute(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorSpeakRoute];
}

id objc_msgSend__multimodalContextMessageReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return [a1 _multimodalContextMessageReceived:x0 fromDevice:x1];
}

id objc_msgSend__muteStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 _muteStateChanged];
}

id objc_msgSend__myBluetoothAddressString(void *a1, const char *a2, ...)
{
  return _[a1 _myBluetoothAddressString];
}

id objc_msgSend__nearbyDeviceInfoTriangleRecoveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyDeviceInfoTriangleRecoveryTimer];
}

id objc_msgSend__nearbyInfoActivityChanged(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoActivityChanged];
}

id objc_msgSend__nearbyInfoActivityCriticalStart(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoActivityCriticalStart];
}

id objc_msgSend__nearbyInfoActivityDelayCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nearbyInfoActivityDelayCheck:");
}

id objc_msgSend__nearbyInfoDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 _nearbyInfoDeviceLost:];
}

id objc_msgSend__nearbyInfoDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoDiscoveryEnsureStarted];
}

id objc_msgSend__nearbyInfoDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoDiscoveryEnsureStopped];
}

id objc_msgSend__nearbyInfoSetAudioRoutingScore(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoSetAudioRoutingScore];
}

id objc_msgSend__nearbyMacAddressTranslate_(void *a1, const char *a2, ...)
{
  return [a1 _nearbyMacAddressTranslate:];
}

id objc_msgSend__nearbyWxChanged_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nearbyWxChanged:");
}

id objc_msgSend__notifyOtherTipiCallState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_notifyOtherTipiCallState:");
}

id objc_msgSend__notifyOtherTipiDeviceTipiScoreChanged_andNewScore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:")];
}

id objc_msgSend__notifyTips_(void *a1, const char *a2, ...)
{
  return [a1 _notifyTips:];
}

id objc_msgSend__onlyMuteAudioFeedbackFlagChanged_(void *a1, const char *a2, ...)
{
  return [a1 _onlyMuteAudioFeedbackFlagChanged:];
}

id objc_msgSend__otherTipiDeviceTipiScoreChanged_withOptions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_otherTipiDeviceTipiScoreChanged:withOptions:")
}

id objc_msgSend__pairedDeviceMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _pairedDeviceMonitorEnsureStarted];
}

id objc_msgSend__pairedDeviceMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _pairedDeviceMonitorEnsureStopped];
}

id objc_msgSend__pickableRoutesChanged(void *a1, const char *a2, ...)
{
  return _[a1 _pickableRoutesChanged];
}

id objc_msgSend__pipeCleanup(void *a1, const char *a2, ...)
{
  return _[a1 _pipeCleanup];
}

id objc_msgSend__pipeConnectionComplete_andWxHeadset_isSender_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_pipeConnectionComplete:andWxHeadset:isSender:");
}

id objc_msgSend__pipeDone(void *a1, const char *a2, ...)
{
  return _[a1 _pipeDone];
}

id objc_msgSend__pipeEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _pipeEnsureStarted];
}

id objc_msgSend__pipeEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _pipeEnsureStopped];
}

id objc_msgSend__pipeRequestCompleted_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_pipeRequestCompleted:error:");
}

id objc_msgSend__pipeRequestResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_pipeRequestResponse:error:");
}

id objc_msgSend__pipeSendRouteRequestToSFDevice_andWxHeadset_newPipe_connectionResult_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:");
}

id objc_msgSend__playChime_(void *a1, const char *a2, ...)
{
  return [a1 _playChime:];
}

id objc_msgSend__pmeConfigDataReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_pmeConfigDataReceived:fromDevice:");
}

id objc_msgSend__postNotification_(void *a1, const char *a2, ...)
{
  return [a1 _postNotification:];
}

id objc_msgSend__powerLogSmartIncomingConnection(void *a1, const char *a2, ...)
{
  return _[a1 _powerLogSmartIncomingConnection];
}

id objc_msgSend__powerLogSmartRoutingScanStarted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_powerLogSmartRoutingScanStarted:");
}

id objc_msgSend__powerLogSmartRoutingScanStopped_(void *a1, const char *a2, ...)
{
  return [a1 _powerLogSmartRoutingScanStopped:];
}

id objc_msgSend__powerMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorEnsureStarted];
}

id objc_msgSend__powerMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorEnsureStopped];
}

id objc_msgSend__powerMonitorScreenLockChanged(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorScreenLockChanged];
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _prefsChanged];
}

id objc_msgSend__proactivelyTakeOwnership(void *a1, const char *a2, ...)
{
  return _[a1 _proactivelyTakeOwnership];
}

id objc_msgSend__processBannerRequestForMuteAction_auditToken_bundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:");
}

id objc_msgSend__processFirstPartyBannerRequestWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processFirstPartyBannerRequestWithCompletion:");
}

id objc_msgSend__productColorAssetExists_withColor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_productColorAssetExists:withColor:");
}

id objc_msgSend__productColorAssetLookup_andAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_productColorAssetLookup:andAddress:");
}

id objc_msgSend__productHasColors_(void *a1, const char *a2, ...)
{
  return [a1 _productHasColors:];
}

id objc_msgSend__receivedAudioCategory_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 _receivedAudioCategory:withOptions:];
}

id objc_msgSend__receivedRelinquishOwnership_wxAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedRelinquishOwnership:wxAddress:")];
}

id objc_msgSend__registerForAVAudioSessionSpeechDetectionStyleChanges(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVAudioSessionSpeechDetectionStyleChanges];
}

id objc_msgSend__registerForAVSystemControllerDeathNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVSystemControllerDeathNotifications];
}

id objc_msgSend__registerForAVSystemControllerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVSystemControllerStateNotifications];
}

id objc_msgSend__registerForAudioSessionResetNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAudioSessionResetNotifications];
}

id objc_msgSend__relayConduitMessageEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _relayConduitMessageEnsureStarted];
}

id objc_msgSend__relayConduitMessageEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _relayConduitMessageEnsureStopped];
}

id objc_msgSend__relayConduitMessageReceived_andSourceDevice_messageType_messageData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_relayConduitMessageReceived:andSourceDevice:messageType:messageData:");
}

id objc_msgSend__relayConduitMessageSend_withOptions_andWxAddress_andOtherAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:");
}

id objc_msgSend__relayConduitMessageStartTimer_withOptions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_relayConduitMessageStartTimer:withOptions:");
}

id objc_msgSend__removeTiPiState_(void *a1, const char *a2, ...)
{
  return [a1 _removeTiPiState:];
}

id objc_msgSend__reportError_(void *a1, const char *a2, ...)
{
  return [a1 _reportError:];
}

id objc_msgSend__reportProgress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_reportProgress:");
}

id objc_msgSend__reportProgress_info_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_reportProgress:info:");
}

id objc_msgSend__reportProgressTriggeredDevice_(void *a1, const char *a2, ...)
{
  return [a1 _reportProgressTriggeredDevice:];
}

id objc_msgSend__requestSensingPredictionInfo_spl_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_requestSensingPredictionInfo:spl:");
}

id objc_msgSend__resetInUserBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 _resetInUserBannerShown];
}

id objc_msgSend__respondRoutingRequest_withResponseHandler_wxAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_respondRoutingRequest:withResponseHandler:wxAddress:");
}

id objc_msgSend__reverseMuteActionForToken_shouldMute_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_reverseMuteActionForToken:shouldMute:");
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return _[a1 _run];
}

id objc_msgSend__runAdvertiser(void *a1, const char *a2, ...)
{
  return _[a1 _runAdvertiser];
}

id objc_msgSend__runConfirm(void *a1, const char *a2, ...)
{
  return _[a1 _runConfirm];
}

id objc_msgSend__runConnectGuestHeadphones(void *a1, const char *a2, ...)
{
  return _[a1 _runConnectGuestHeadphones];
}

id objc_msgSend__runGuestiOSConnect(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSConnect];
}

id objc_msgSend__runGuestiOSPairSetupPublic(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSPairSetupPublic];
}

id objc_msgSend__runGuestiOSShareAudio(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudio];
}

id objc_msgSend__runGuestiOSShareAudioConnect(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioConnect];
}

id objc_msgSend__runGuestiOSShareAudioConnectSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioConnectSendRequest];
}

id objc_msgSend__runGuestiOSShareAudioSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioSendRequest];
}

id objc_msgSend__runInit(void *a1, const char *a2, ...)
{
  return _[a1 _runInit];
}

id objc_msgSend__runPipeStates(void *a1, const char *a2, ...)
{
  return _[a1 _runPipeStates];
}

id objc_msgSend__runScannerNearbyInfo(void *a1, const char *a2, ...)
{
  return _[a1 _runScannerNearbyInfo];
}

id objc_msgSend__runScannerProxPairing(void *a1, const char *a2, ...)
{
  return _[a1 _runScannerProxPairing];
}

id objc_msgSend__runShareAudioServiceConfigRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_runShareAudioServiceConfigRequest:responseHandler:)
}

id objc_msgSend__runShareAudioServiceConfigResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_runShareAudioServiceConfigResponse:");
}

id objc_msgSend__runShareAudioServiceConnectRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_runShareAudioServiceConnectRequest:responseHandler:");
}

id objc_msgSend__runShareAudioServiceStart(void *a1, const char *a2, ...)
{
  return _[a1 _runShareAudioServiceStart];
}

id objc_msgSend__runShowHeadphonesPairingInstructions(void *a1, const char *a2, ...)
{
  return _[a1 _runShowHeadphonesPairingInstructions];
}

id objc_msgSend__runWaitForConfigRequestOrProxTrigger(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForConfigRequestOrProxTrigger];
}

id objc_msgSend__runWaitForConnectRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForConnectRequest];
}

id objc_msgSend__runWaitForGuestHeadphones(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForGuestHeadphones];
}

id objc_msgSend__runWaitForGuestHeadphonesPairingMode(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForGuestHeadphonesPairingMode];
}

id objc_msgSend__runWaitForProxTrigger(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForProxTrigger];
}

id objc_msgSend__saveDeviceRecordForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_saveDeviceRecordForDevice:");
}

id objc_msgSend__scheduleUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleUpdate];
}

id objc_msgSend__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:");
}

id objc_msgSend__sendAudioCategory_withAudioCategory_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendAudioCategory:withAudioCategory:");
}

id objc_msgSend__sendAudioCategoryToAllTipiDevices(void *a1, const char *a2, ...)
{
  return _[a1 _sendAudioCategoryToAllTipiDevices];
}

id objc_msgSend__sendCloudConfigsToDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendCloudConfigsToDevice:");
}

id objc_msgSend__sendConfigOverAAController_device_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendConfigOverAAController:device:completion:");
}

id objc_msgSend__sendConfigOverCBController_device_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendConfigOverCBController:device:completion:");
}

id objc_msgSend__sendConversationDetectMessage_destinationIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 _sendConversationDetectMessage:destinationIdentifier:completion:];
}

id objc_msgSend__sendDeviceConfig_identifier_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendDeviceConfig:identifier:completion:");
}

id objc_msgSend__sendRouteReversedTipiEventForTipsSupport(void *a1, const char *a2, ...)
{
  return _[a1 _sendRouteReversedTipiEventForTipsSupport];
}

id objc_msgSend__sendSiriMultitoneConfigToDevice_(void *a1, const char *a2, ...)
{
  return [a1 _sendSiriMultitoneConfigToDevice:];
}

id objc_msgSend__sendTipiHealingRequest_andOtherTipiAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendTipiHealingRequest:andOtherTipiAddress:");
}

id objc_msgSend__sendTipiScoreUpdateToWx(void *a1, const char *a2, ...)
{
  return _[a1 _sendTipiScoreUpdateToWx];
}

id objc_msgSend__setBtAddress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setBtAddress:");
}

id objc_msgSend__setCDSignalAudioTunings_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setCDSignalAudioTunings:");
}

id objc_msgSend__setConcertVenueAirPodsInEarTipShown(void *a1, const char *a2, ...)
{
  return _[a1 _setConcertVenueAirPodsInEarTipShown];
}

id objc_msgSend__setConcertVenueAirPodsNearybyTipShown(void *a1, const char *a2, ...)
{
  return _[a1 _setConcertVenueAirPodsNearybyTipShown];
}

id objc_msgSend__setConnectedBannerTick_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setConnectedBannerTick:");
}

id objc_msgSend__setConnectionState_(void *a1, const char *a2, ...)
{
  return [a1 _setConnectionState:];
}

id objc_msgSend__setFirstBannerShown_(void *a1, const char *a2, ...)
{
  return [a1 _setFirstBannerShown:];
}

id objc_msgSend__setHRTFAssetDownloadOTA(void *a1, const char *a2, ...)
{
  return _[a1 _setHRTFAssetDownloadOTA];
}

id objc_msgSend__setHighPriorityTag_withHighPriority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setHighPriorityTag:withHighPriority:");
}

id objc_msgSend__setHijackBackoffTick_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setHijackBackoffTick:");
}

id objc_msgSend__setInUseBannerBackoffReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setInUseBannerBackoffReason:");
}

id objc_msgSend__setInUseBannerBackoffTick_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setInUseBannerBackoffTick:");
}

id objc_msgSend__setInUseBannerShown_(void *a1, const char *a2, ...)
{
  return [a1 _setInUseBannerShown:];
}

id objc_msgSend__setIncomingCallRingtoneState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setIncomingCallRingtoneState:");
}

id objc_msgSend__setIsFirstConnentionAfterSREnable_forDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setIsFirstConnentionAfterSREnable:forDevice:");
}

id objc_msgSend__setIsNearby_(void *a1, const char *a2, ...)
{
  return [a1 _setIsNearby:];
}

id objc_msgSend__setManualRoute_(void *a1, const char *a2, ...)
{
  return [a1 _setManualRoute:];
}

id objc_msgSend__setManualRouteChangeInProgress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setManualRouteChangeInProgress:");
}

id objc_msgSend__setManualRouteFlag_withManualRoute_(void *a1, const char *a2, ...)
{
  return [a1 _setManualRouteFlag:withManualRoute:];
}

id objc_msgSend__setNearbyConnectedSourceCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setNearbyConnectedSourceCount:");
}

id objc_msgSend__setNearbyInEar_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setNearbyInEar:");
}

id objc_msgSend__setNearbyLastRouteHost_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyLastRouteHost:];
}

id objc_msgSend__setNearbyName_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyName:];
}

id objc_msgSend__setNearbyOutOfCaseTime_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setNearbyOutOfCaseTime:");
}

id objc_msgSend__setNearbyPaired_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyPaired:];
}

id objc_msgSend__setNearbyPrevInEar_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyPrevInEar:];
}

id objc_msgSend__setNearbyProductID_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyProductID:];
}

id objc_msgSend__setNearbyStreamState_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyStreamState:];
}

id objc_msgSend__setNearbyWxDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setNearbyWxDevice:");
}

id objc_msgSend__setNearbyiCloudSignIn_(void *a1, const char *a2, ...)
{
  return [a1 _setNearbyiCloudSignIn:];
}

id objc_msgSend__setOtherTipiAudioCategory_(void *a1, const char *a2, ...)
{
  return [a1 _setOtherTipiAudioCategory:];
}

id objc_msgSend__setOtherTipiDeviceBTAddress_andName_sourceVersion_withResult_(void *a1, const char *a2, ...)
{
  return [a1 _setOtherTipiDeviceBTAddress:andName:sourceVersion:withResult:];
}

id objc_msgSend__setOtherTipiDeviceBuildVersion_andMinorBuildVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:");
}

id objc_msgSend__setOtherTipiDeviceInfo_andName_andVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOtherTipiDeviceInfo:andName:andVersion:");
}

id objc_msgSend__setOtherTipiDeviceIsStreamingAudio_(void *a1, const char *a2, ...)
{
  return [a1 _setOtherTipiDeviceIsStreamingAudio:];
}

id objc_msgSend__setOtherTipiDeviceIsWatch_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOtherTipiDeviceIsWatch:");
}

id objc_msgSend__setOtherTipiManuallyRouteTick_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOtherTipiManuallyRouteTick:");
}

id objc_msgSend__setOtherTipiPlayingApp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOtherTipiPlayingApp:");
}

id objc_msgSend__setOwnership_(void *a1, const char *a2, ...)
{
  return [a1 _setOwnership:];
}

id objc_msgSend__setOwnership_withHijackRequest_withOwnership_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setOwnership:withHijackRequest:withOwnership:");
}

id objc_msgSend__setPedestrianFenceWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 _setPedestrianFenceWithHandler:];
}

id objc_msgSend__setPhase1ConnectConfig_andType_(void *a1, const char *a2, ...)
{
  return [a1 _setPhase1ConnectConfig:andType:];
}

id objc_msgSend__setPipeMessageStats_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setPipeMessageStats:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setRouteToWxAfterUnhide_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setRouteToWxAfterUnhide:");
}

id objc_msgSend__setRoutedState_(void *a1, const char *a2, ...)
{
  return [a1 _setRoutedState:];
}

id objc_msgSend__setRoutingAction_(void *a1, const char *a2, ...)
{
  return [a1 _setRoutingAction:];
}

id objc_msgSend__setRoutingInitialized_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setRoutingInitialized:");
}

id objc_msgSend__setRoutingUI_(void *a1, const char *a2, ...)
{
  return [a1 _setRoutingUI:];
}

id objc_msgSend__setShouldStayOnVirtual_(void *a1, const char *a2, ...)
{
  return [a1 _setShouldStayOnVirtual:];
}

id objc_msgSend__setTipiAndRoutedStateFlags_(void *a1, const char *a2, ...)
{
  return [a1 _setTipiAndRoutedStateFlags:];
}

id objc_msgSend__setTipiAndRoutedStateFlags_forDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setTipiAndRoutedStateFlags:forDevice:");
}

id objc_msgSend__setTipiElectionInProgress_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setTipiElectionInProgress:");
}

id objc_msgSend__setTipiElectionReceivedLePipe_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setTipiElectionReceivedLePipe:");
}

id objc_msgSend__setTipiElectionType_withDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setTipiElectionType:withDevice:");
}

id objc_msgSend__setUserConnectedState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setUserConnectedState:");
}

id objc_msgSend__shareAudioActionScannerDeviceLost_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shareAudioActionScannerDeviceLost:");
}

id objc_msgSend__shareAudioActionScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _shareAudioActionScannerEnsureStarted];
}

id objc_msgSend__shareAudioActionScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _shareAudioActionScannerEnsureStopped];
}

id objc_msgSend__shareAudioSessionEnded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shareAudioSessionEnded:");
}

id objc_msgSend__shareAudioSessionStartWithDarwinDevice_wxDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shareAudioSessionStartWithDarwinDevice:wxDevice:");
}

id objc_msgSend__shareAudioShowConnectBanner_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shareAudioShowConnectBanner:");
}

id objc_msgSend__shouldRunHeadGesture(void *a1, const char *a2, ...)
{
  return _[a1 _shouldRunHeadGesture];
}

id objc_msgSend__shouldSendXPCMessage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendXPCMessage];
}

id objc_msgSend__showHIDIntervalBannerIfEnabled_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_showHIDIntervalBannerIfEnabled:");
}

id objc_msgSend__showHIDLagBannerIfEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _showHIDLagBannerIfEnabled:];
}

id objc_msgSend__smartRoutingAddWxMapDevice_routingAction_otherAddress_otherName_otherSourceVersion_isRoutingInitialized_newWx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:");
}

id objc_msgSend__smartRoutingAddWxMapDeviceFromConnectedDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingAddWxMapDeviceFromConnectedDevice:");
}

id objc_msgSend__smartRoutingAudioRoutingRequest_withResponseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingAudioRoutingRequest:withResponseHandler:");
}

id objc_msgSend__smartRoutingChangeRoute_(void *a1, const char *a2, ...)
{
  return [a1 _smartRoutingChangeRoute:];
}

id objc_msgSend__smartRoutingConnectToEligibleHeadset_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingConnectToEligibleHeadset:");
}

id objc_msgSend__smartRoutingConnectionCompleted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingConnectionCompleted:");
}

id objc_msgSend__smartRoutingLowerRateScan(void *a1, const char *a2, ...)
{
  return _[a1 _smartRoutingLowerRateScan];
}

id objc_msgSend__smartRoutingModeCheck_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingModeCheck:");
}

id objc_msgSend__smartRoutingShowBanner_withDevice_andDeviceAddress_andProductID_andCentralContentItemTxt_andTimeout_andDeviceType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:");
}

id objc_msgSend__startAudioStateSnapshotTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startAudioStateSnapshotTimer];
}

id objc_msgSend__startHighActivityLevelTimer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startHighActivityLevelTimer:");
}

id objc_msgSend__startHijackMetricSubmission_wxAddress_version_(void *a1, const char *a2, ...)
{
  return [a1 _startHijackMetricSubmission:wxAddress:version:];
}

id objc_msgSend__startInUseBannerTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startInUseBannerTimer];
}

id objc_msgSend__startManualRouteChangeDetectionTimer_(void *a1, const char *a2, ...)
{
  return [a1 _startManualRouteChangeDetectionTimer:];
}

id objc_msgSend__startPedestrianFenceSession(void *a1, const char *a2, ...)
{
  return _[a1 _startPedestrianFenceSession];
}

id objc_msgSend__startPhoneTriangleOwnershipTimer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startPhoneTriangleOwnershipTimer:");
}

id objc_msgSend__startPlaybackTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startPlaybackTimer];
}

id objc_msgSend__startQueuedRampForDuration_startLevel_endLevel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startQueuedRampForDuration:startLevel:endLevel:");
}

id objc_msgSend__startRingtoneTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRingtoneTimer];
}

id objc_msgSend__startRouteChangeDetectionTimer_andAnswer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startRouteChangeDetectionTimer:andAnswer:");
}

id objc_msgSend__startRouteCheckTimer_andType_(void *a1, const char *a2, ...)
{
  return [a1 _startRouteCheckTimer:andType:];
}

id objc_msgSend__startTipiHealing_withLastConnect_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startTipiHealing:withLastConnect:");
}

id objc_msgSend__startTipiSetupTicks(void *a1, const char *a2, ...)
{
  return _[a1 _startTipiSetupTicks];
}

id objc_msgSend__statedumpAndRecordDailyMetric(void *a1, const char *a2, ...)
{
  return _[a1 _statedumpAndRecordDailyMetric];
}

id objc_msgSend__statsEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _statsEnsureStarted];
}

id objc_msgSend__stopAudioStateSnapshotTimer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_stopAudioStateSnapshotTimer:");
}

id objc_msgSend__stopHeadGestureManager(void *a1, const char *a2, ...)
{
  return _[a1 _stopHeadGestureManager];
}

id objc_msgSend__stopPedestrianFenceSession(void *a1, const char *a2, ...)
{
  return _[a1 _stopPedestrianFenceSession];
}

id objc_msgSend__submitConnectionMetric_andError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitConnectionMetric:andError:");
}

id objc_msgSend__submitHijackBlockMetric_withReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitHijackBlockMetric:withReason:");
}

id objc_msgSend__submitManualConnectionMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitManualConnectionMetric:");
}

id objc_msgSend__submitManualRouteDetectionMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitManualRouteDetectionMetric:");
}

id objc_msgSend__submitMetric_(void *a1, const char *a2, ...)
{
  return [a1 _submitMetric:];
}

id objc_msgSend__submitMetricNearby_(void *a1, const char *a2, ...)
{
  return [a1 _submitMetricNearby:];
}

id objc_msgSend__submitMetricTipiHealingforDevice_withDuration_andLegacy_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitMetricTipiHealingforDevice:withDuration:andLegacy:");
}

id objc_msgSend__submitMetricsForMuteAction_auditTokenBundleID_appName_appBundleID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitMetricsForMuteAction:auditTokenBundleID:appName:appBundleID:");
}

id objc_msgSend__submitNearbyDeviceMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitNearbyDeviceMetric:");
}

id objc_msgSend__submitRouteChangeDetectionMetric_andAnswer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitRouteChangeDetectionMetric:andAnswer:");
}

id objc_msgSend__supportsSR_andProductID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_supportsSR:andProductID:");
}

id objc_msgSend__supportsTipi_(void *a1, const char *a2, ...)
{
  return [a1 _supportsTipi:];
}

id objc_msgSend__systemUIMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _systemUIMonitorEnsureStarted];
}

id objc_msgSend__systemUIMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _systemUIMonitorEnsureStopped];
}

id objc_msgSend__tipiHealing_withDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_tipiHealing:withDevice:");
}

id objc_msgSend__tipiHealingAttempt(void *a1, const char *a2, ...)
{
  return _[a1 _tipiHealingAttempt];
}

id objc_msgSend__tipiHealingHijackTimerStart_withScore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_tipiHealingHijackTimerStart:withScore:")];
}

id objc_msgSend__tipiHealingStartTimer_(void *a1, const char *a2, ...)
{
  return [a1 _tipiHealingStartTimer:];
}

id objc_msgSend__tipihHealingV2Handling_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_tipihHealingV2Handling:");
}

id objc_msgSend__triggerTipiTableUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerTipiTableUpdate:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateAccessoriesWithMotionState_(void *a1, const char *a2, ...)
{
  return [a1 _updateAccessoriesWithMotionState:];
}

id objc_msgSend__updateAccessoriesWithPauseState(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccessoriesWithPauseState];
}

id objc_msgSend__updateAccessoryID_connectionDeviceAddresses_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAccessoryID:connectionDeviceAddresses:completion:");
}

id objc_msgSend__updateAudioRoute_withUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAudioRoute:withUUID:");
}

id objc_msgSend__updateBannerChimeSuppressionState(void *a1, const char *a2, ...)
{
  return _[a1 _updateBannerChimeSuppressionState];
}

id objc_msgSend__updateConversationDetectSignal_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateConversationDetectSignal:");
}

id objc_msgSend__updateDetectedHeadGesture_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateDetectedHeadGesture:");
}

id objc_msgSend__updateHijackBlockingClientWithBundleID_mode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateHijackBlockingClientWithBundleID:mode:");
}

id objc_msgSend__updateLocalAudioCategory_(void *a1, const char *a2, ...)
{
  return [a1 _updateLocalAudioCategory:];
}

id objc_msgSend__updateMasterZoneBlob_accessoryblob_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateMasterZoneBlob:accessoryblob:");
}

id objc_msgSend__updateMuteAction_auditToken_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateMuteAction:auditToken:bundleIdentifier:");
}

id objc_msgSend__updateNearbyDeviceState_withAddress_withEasyPairing_withState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:");
}

id objc_msgSend__updateOtherTipiBuildVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateOtherTipiBuildVersion:");
}

id objc_msgSend__updateOtherTipiDevice_otherAddress_otherName_otherVersion_withResult_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:");
}

id objc_msgSend__updateOtherTipiDevicewithAudioCategory_otherAddress_otherName_otherVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:");
}

id objc_msgSend__updatePauseState(void *a1, const char *a2, ...)
{
  return _[a1 _updatePauseState];
}

id objc_msgSend__updateRoutingActionForManuallyRoute(void *a1, const char *a2, ...)
{
  return _[a1 _updateRoutingActionForManuallyRoute];
}

id objc_msgSend__updateSRDiscoveredDeviceForCBDeviceChanged_connectionStatus_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:");
}

id objc_msgSend__updateSRDiscoveredDeviceForNearbyWxChanged_isNearby_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:");
}

id objc_msgSend__verifyWxConnectedBTAddress_withVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_verifyWxConnectedBTAddress:withVersion:");
}

id objc_msgSend__verifyWxConnectedRouted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_verifyWxConnectedRouted:");
}

id objc_msgSend__wxDeviceFound_(void *a1, const char *a2, ...)
{
  return [_wxDeviceFound:];
}

id objc_msgSend__wxDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 _wxDeviceLost:];
}

id objc_msgSend__wxDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryEnsureStarted];
}

id objc_msgSend__wxDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryEnsureStopped];
}

id objc_msgSend__wxDiscoveryWatchRecoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryWatchRecoveryEnsureStarted];
}

id objc_msgSend__wxDiscoveryWatchRecoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryWatchRecoveryEnsureStopped];
}

id objc_msgSend__wxDiscoveryWatchRecoveryLostDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_wxDiscoveryWatchRecoveryLostDevice:");
}

id objc_msgSend__xpcConnectionInvalidated_(void *a1, const char *a2, ...)
{
  return [_xpcConnectionInvalidated:];
}

id objc_msgSend__xpcReceivedAccessoryEvent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcReceivedAccessoryEvent:");
}

id objc_msgSend__xpcReceivedAudioAccessoryDeviceInfoChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcReceivedAudioAccessoryDeviceInfoChange:");
}

id objc_msgSend__xpcReceivedMessage_(void *a1, const char *a2, ...)
{
  return [a1 _xpcReceivedMessage:];
}

id objc_msgSend_aaServicesRequireReset(void *a1, const char *a2, ...)
{
  return _[a1 aaServicesRequireReset];
}

id objc_msgSend_acceptReplyPlayPauseConfig(void *a1, const char *a2, ...)
{
  return _[a1 acceptReplyPlayPauseConfig];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAvailable(void *a1, const char *a2, ...)
{
  return _[a1 accountAvailable];
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 accountInfoWithCompletionHandler:];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return _[a1 accountStatus];
}

id objc_msgSend_accountStatusAvailable_force_(void *a1, const char *a2, ...)
{
  return [a1 accountStatusAvailable:force:];
}

id objc_msgSend_accountStatusDidChange_(void *a1, const char *a2, ...)
{
  return [a1 accountStatusDidChange:];
}

id objc_msgSend_accountStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 accountStatusWithCompletionHandler:];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_aclPriority(void *a1, const char *a2, ...)
{
  return _[a1 aclPriority];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 activateAssertionWithIdentifier:];
}

id objc_msgSend_activateAudioSessionControl_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "activateAudioSessionControl:completion:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletion:];
}

id objc_msgSend_activeCallCount(void *a1, const char *a2, ...)
{
  return _[a1 activeCallCount];
}

id objc_msgSend_activePlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 activePlayingApp];
}

id objc_msgSend_activeTransactions(void *a1, const char *a2, ...)
{
  return _[a1 activeTransactions];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityHandler(void *a1, const char *a2, ...)
{
  return _[a1 activityHandler];
}

id objc_msgSend_adaptiveVolumeConfig(void *a1, const char *a2, ...)
{
  return _[a1 adaptiveVolumeConfig];
}

id objc_msgSend_addAccountMagicKeysWithCloudRecord_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addAccountMagicKeysWithCloudRecord:");
}

id objc_msgSend_addActionWithIdentifier_title_flags_handler_(void *a1, const char *a2, ...)
{
  return [a1 addActionWithIdentifier:title:flags:handler:];
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addDeviceMagicSettingsWithRecord_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addDeviceMagicSettingsWithRecord:completion:");
}

id objc_msgSend_addDeviceSupportInformationWithRecord_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addDeviceSupportInformationWithRecord:completion:");
}

id objc_msgSend_addDeviceWithRecord_completion_(void *a1, const char *a2, ...)
{
  return [a1 addDeviceWithRecord:x0 completion:x1];
}

id objc_msgSend_addLegacyMagicPairingRecordsWithCloudRecord_userInitiated_completion_(void *a1, const char *a2, ...)
{
  return [a1 addLegacyMagicPairingRecordsWithCloudRecord:x0 userInitiated:x1 completion:x2];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 addOperationWithBlock:];
}

id objc_msgSend_addSoundProfileRecordWithURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 addSoundProfileRecordWithURL:x0 completion:x1];
}

id objc_msgSend_addWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 addWithDelegate:];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_addressData(void *a1, const char *a2, ...)
{
  return _[a1 addressData];
}

id objc_msgSend_addressString(void *a1, const char *a2, ...)
{
  return _[a1 addressString];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return _[a1 advertisementFields];
}

id objc_msgSend_allDevicesStarSky(void *a1, const char *a2, ...)
{
  return _[a1 allDevicesStarSky];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowHijackWithAudioScore_hijackRoute_hijackDeniedReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:");
}

id objc_msgSend_allowNoiseManagementOff(void *a1, const char *a2, ...)
{
  return _[a1 allowNoiseManagementOff];
}

id objc_msgSend_allowsAutoRoute(void *a1, const char *a2, ...)
{
  return _[a1 allowsAutoRoute];
}

id objc_msgSend_appBundleID(void *a1, const char *a2, ...)
{
  return _[a1 appBundleID];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appleIDAddProof_dispatchQueue_completion_(void *a1, const char *a2, ...)
{
  return [a1 appleIDAddProof:x0 dispatchQueue:x1 completion:x2];
}

id objc_msgSend_appleIDVerifyProof_dispatchQueue_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "appleIDVerifyProof:dispatchQueue:completion:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:")];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantIsEnabled];
}

id objc_msgSend_associatedDevices(void *a1, const char *a2, ...)
{
  return _[a1 associatedDevices];
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return [a1 attributeForKey:];
}

id objc_msgSend_audioDestination(void *a1, const char *a2, ...)
{
  return _[a1 audioDestination];
}

id objc_msgSend_audioFeedbackConfig(void *a1, const char *a2, ...)
{
  return _[a1 audioFeedbackConfig];
}

id objc_msgSend_audioRoute(void *a1, const char *a2, ...)
{
  return _[a1 audioRoute];
}

id objc_msgSend_audioRouteHidden(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteHidden];
}

id objc_msgSend_audioRoutingClientID(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingClientID];
}

id objc_msgSend_audioRoutingRequest(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingRequest];
}

id objc_msgSend_audioRoutingResponse(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingResponse];
}

id objc_msgSend_audioRoutingScore(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingScore];
}

id objc_msgSend_audioScore(void *a1, const char *a2, ...)
{
  return _[a1 audioScore];
}

id objc_msgSend_audioSession(void *a1, const char *a2, ...)
{
  return _[a1 audioSession];
}

id objc_msgSend_audioSessionControlActivate_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "audioSessionControlActivate:completion:");
}

id objc_msgSend_audioSessionControlUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "audioSessionControlUpdate:");
}

id objc_msgSend_audioState(void *a1, const char *a2, ...)
{
  return _[a1 audioState];
}

id objc_msgSend_audioStreamState(void *a1, const char *a2, ...)
{
  return _[a1 audioStreamState];
}

id objc_msgSend_audiogramCreationTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 audiogramCreationTimestamp];
}

id objc_msgSend_audiogramEnrolledTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 audiogramEnrolledTimestamp];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoANCStrength(void *a1, const char *a2, ...)
{
  return _[a1 autoANCStrength];
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return _[a1 availableDevices];
}

id objc_msgSend_avgConfidence(void *a1, const char *a2, ...)
{
  return _[a1 avgConfidence];
}

id objc_msgSend_axHeadTrackingSettingChanged(void *a1, const char *a2, ...)
{
  return _[a1 axHeadTrackingSettingChanged];
}

id objc_msgSend_bannerAction(void *a1, const char *a2, ...)
{
  return _[a1 bannerAction];
}

id objc_msgSend_bannerTrigger(void *a1, const char *a2, ...)
{
  return _[a1 bannerTrigger];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_batteryInfo(void *a1, const char *a2, ...)
{
  return _[a1 batteryInfo];
}

id objc_msgSend_batteryLeft(void *a1, const char *a2, ...)
{
  return _[a1 batteryLeft];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevel];
}

id objc_msgSend_batteryLevelInfo(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelInfo];
}

id objc_msgSend_batteryLevelLeft(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelLeft];
}

id objc_msgSend_batteryLevelMain(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelMain];
}

id objc_msgSend_batteryLevelRight(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelRight];
}

id objc_msgSend_batteryMain(void *a1, const char *a2, ...)
{
  return _[a1 batteryMain];
}

id objc_msgSend_batteryRight(void *a1, const char *a2, ...)
{
  return _[a1 batteryRight];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _[a1 batteryState];
}

id objc_msgSend_batteryType(void *a1, const char *a2, ...)
{
  return _[a1 batteryType];
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction:];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _[a1 bleDevice];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAddress];
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothIdentifier];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _[a1 btAddressData];
}

id objc_msgSend_btXID(void *a1, const char *a2, ...)
{
  return _[a1 btXID];
}

id objc_msgSend_buddySetupDone(void *a1, const char *a2, ...)
{
  return _[a1 buddySetupDone];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedIsNetworkUp(void *a1, const char *a2, ...)
{
  return _[a1 cachedIsNetworkUp];
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 callCenterWithQueue:];
}

id objc_msgSend_callConnected(void *a1, const char *a2, ...)
{
  return _[a1 callConnected];
}

id objc_msgSend_callCountIncomingConnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountIncomingConnected];
}

id objc_msgSend_callCountIncomingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountIncomingUnconnected];
}

id objc_msgSend_callCountOutgoingConnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountOutgoingConnected];
}

id objc_msgSend_callCountOutgoingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountOutgoingUnconnected];
}

id objc_msgSend_callFlags(void *a1, const char *a2, ...)
{
  return _[a1 callFlags];
}

id objc_msgSend_callIncomingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callIncomingUnconnected];
}

id objc_msgSend_callStartTicks(void *a1, const char *a2, ...)
{
  return _[a1 callStartTicks];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUID];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 callbackQueue];
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _[a1 canSend];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_cdSignalAudioInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 cdSignalAudioInterrupted];
}

id objc_msgSend_centerContentItemsText(void *a1, const char *a2, ...)
{
  return _[a1 centerContentItemsText];
}

id objc_msgSend_checkFirstUnlockForIDS(void *a1, const char *a2, ...)
{
  return _[a1 checkFirstUnlockForIDS];
}

id objc_msgSend_clearFence_(void *a1, const char *a2, ...)
{
  return [a1 clearFence:];
}

id objc_msgSend_clickHoldModeLeft(void *a1, const char *a2, ...)
{
  return _[a1 clickHoldModeLeft];
}

id objc_msgSend_clickHoldModeRight(void *a1, const char *a2, ...)
{
  return _[a1 clickHoldModeRight];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_clientReportHMDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return [a1 clientReportHMDeviceCloudRecordInfosUpdated:];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return _[a1 clients];
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 closeAndReturnError:];
}

id objc_msgSend_cloudAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 cloudAccountInfo];
}

id objc_msgSend_cloudContainerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudContainerIdentifier];
}

id objc_msgSend_cloudDevices(void *a1, const char *a2, ...)
{
  return _[a1 cloudDevices];
}

id objc_msgSend_cloudIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudIdentifier];
}

id objc_msgSend_cloudKitConnection(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitConnection];
}

id objc_msgSend_cloudKitContainer(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitContainer];
}

id objc_msgSend_cloudKitDatabase(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitDatabase];
}

id objc_msgSend_cloudPairingCompletedWithResponse_localKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:")
}

id objc_msgSend_cloudPairingQueue(void *a1, const char *a2, ...)
{
  return _[a1 cloudPairingQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectFeedbackWithLaunchConfiguration_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "collectFeedbackWithLaunchConfiguration:completion:");
}

id objc_msgSend_colorCode(void *a1, const char *a2, ...)
{
  return _[a1 colorCode];
}

id objc_msgSend_colorCodeBest(void *a1, const char *a2, ...)
{
  return _[a1 colorCodeBest];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithString:];
}

id objc_msgSend_conduitDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 conduitDeviceID];
}

id objc_msgSend_conduitMessageTicks(void *a1, const char *a2, ...)
{
  return _[a1 conduitMessageTicks];
}

id objc_msgSend_conduitMessageTimer(void *a1, const char *a2, ...)
{
  return _[a1 conduitMessageTimer];
}

id objc_msgSend_conferencingCallSets(void *a1, const char *a2, ...)
{
  return _[a1 conferencingCallSets];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _[a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return _[a1 connected];
}

id objc_msgSend_connectedCallCount(void *a1, const char *a2, ...)
{
  return _[a1 connectedCallCount];
}

id objc_msgSend_connectedServices(void *a1, const char *a2, ...)
{
  return _[a1 connectedServices];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionFlags(void *a1, const char *a2, ...)
{
  return _[a1 connectionFlags];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_connectionUpdatedForBluetoothIdentifier_connected_(void *a1, const char *a2, ...)
{
  return [a1 connectionUpdatedForBluetoothIdentifier:connected:];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerWithIdentifier:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_controllerInfoAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 controllerInfoAndReturnError:];
}

id objc_msgSend_conversationDetectCapability(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectCapability];
}

id objc_msgSend_conversationDetectConfig(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectConfig];
}

id objc_msgSend_conversationDetectSignal(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectSignal];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_coreBluetoothDevice(void *a1, const char *a2, ...)
{
  return _[a1 coreBluetoothDevice];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_counterpartIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 counterpartIdentifier];
}

id objc_msgSend_cpDescription(void *a1, const char *a2, ...)
{
  return _[a1 cpDescription];
}

id objc_msgSend_createDeviceRecord_completion_(void *a1, const char *a2, ...)
{
  return [a1 createDeviceRecord:completion:];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_createSoundProfileRecordStagingURL(void *a1, const char *a2, ...)
{
  return _[a1 createSoundProfileRecordStagingURL];
}

id objc_msgSend_createSubscritionForRecordType_(void *a1, const char *a2, ...)
{
  return [a1 createSubscritionForRecordType:];
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return _[a1 criteria];
}

id objc_msgSend_crownRotationDirection(void *a1, const char *a2, ...)
{
  return _[a1 crownRotationDirection];
}

id objc_msgSend_cuFilteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 cuFilteredArrayUsingBlock:];
}

id objc_msgSend_cuValueForEntitlementNoCache_(void *a1, const char *a2, ...)
{
  return [a1 cuValueForEntitlementNoCache:];
}

id objc_msgSend_currentCDDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentCDDeviceIdentifier];
}

id objc_msgSend_currentCampaign(void *a1, const char *a2, ...)
{
  return _[a1 currentCampaign];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0, x1, x2];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_declineCount(void *a1, const char *a2, ...)
{
  return _[a1 declineCount];
}

id objc_msgSend_declineDismissSkipConfig(void *a1, const char *a2, ...)
{
  return _[a1 declineDismissSkipConfig];
}

id objc_msgSend_defaultAudioTunings(void *a1, const char *a2, ...)
{
  return _[a1 defaultAudioTunings];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteCloudKitAccessoryZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteCloudKitAccessoryZone];
}

id objc_msgSend_deleteLegacyMagicPairingRecordsWithUserInitiated_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deleteLegacyMagicPairingRecordsWithUserInitiated:completion:");
}

id objc_msgSend_deleteLegacyMasterKey(void *a1, const char *a2, ...)
{
  return _[a1 deleteLegacyMasterKey];
}

id objc_msgSend_deleteRecordWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordWithID:x0 completionHandler:x1];
}

id objc_msgSend_deleteRecordZoneWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordZoneWithID:x0 completionHandler:x1];
}

id objc_msgSend_deleteSubscriptionWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteSubscriptionWithID:x0 completionHandler:x1];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return _[a1 deviceActionType];
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 deviceAddress];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return [a1 deviceForFromID:];
}

id objc_msgSend_deviceForIDSDevice_createNew_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deviceForIDSDevice:createNew:");
}

id objc_msgSend_deviceHeadGestureDetected_(void *a1, const char *a2, ...)
{
  return [a1 deviceHeadGestureDetected:];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return _[a1 deviceManager];
}

id objc_msgSend_deviceManagerFoundDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deviceManagerFoundDevice:");
}

id objc_msgSend_deviceManagerHeadGestureDetected_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deviceManagerHeadGestureDetected:");
}

id objc_msgSend_deviceManagerLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 deviceManagerLostDevice:];
}

id objc_msgSend_deviceManagerReportDeviceFound_(void *a1, const char *a2, ...)
{
  return [a1 deviceManagerReportDeviceFound:];
}

id objc_msgSend_deviceManagerReportDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 deviceManagerReportDeviceLost:];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_deviceTypeToString(void *a1, const char *a2, ...)
{
  return _[a1 deviceTypeToString];
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return _[a1 deviceVersion];
}

id objc_msgSend_deviceWithIDSDevice_(void *a1, const char *a2, ...)
{
  return [a1 deviceWithIDSDevice:];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_diagnosticControl_completion_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticControl:x0 completion:x1];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_directoryChanged(void *a1, const char *a2, ...)
{
  return _[a1 directoryChanged];
}

id objc_msgSend_directoryURL(void *a1, const char *a2, ...)
{
  return _[a1 directoryURL];
}

id objc_msgSend_disableCount(void *a1, const char *a2, ...)
{
  return _[a1 disableCount];
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilitySignal];
}

id objc_msgSend_discoverableState(void *a1, const char *a2, ...)
{
  return _[a1 discoverableState];
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _[a1 discoveredDevices];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_dispatchSourceAbort(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceAbort];
}

id objc_msgSend_dispatchSourceChange(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceChange];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleTapActionLeft(void *a1, const char *a2, ...)
{
  return _[a1 doubleTapActionLeft];
}

id objc_msgSend_doubleTapActionRight(void *a1, const char *a2, ...)
{
  return _[a1 doubleTapActionRight];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadHRTFAsset(void *a1, const char *a2, ...)
{
  return _[a1 downloadHRTFAsset];
}

id objc_msgSend_downloadHRTFAsset_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 downloadHRTFAsset:withCompletion:];
}

id objc_msgSend_duetActivitySchedulerData(void *a1, const char *a2, ...)
{
  return _[a1 duetActivitySchedulerData];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_enableCount(void *a1, const char *a2, ...)
{
  return _[a1 enableCount];
}

id objc_msgSend_enableHearingAidGainSwipe(void *a1, const char *a2, ...)
{
  return _[a1 enableHearingAidGainSwipe];
}

id objc_msgSend_enableHearingAssist(void *a1, const char *a2, ...)
{
  return _[a1 enableHearingAssist];
}

id objc_msgSend_enableHeartRateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 enableHeartRateMonitor];
}

id objc_msgSend_enableSiriMultitone(void *a1, const char *a2, ...)
{
  return _[a1 enableSiriMultitone];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt64:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValues];
}

id objc_msgSend_endCallConfig(void *a1, const char *a2, ...)
{
  return _[a1 endCallConfig];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _[a1 endSession];
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return [a1 endTransaction:];
}

id objc_msgSend_entitled(void *a1, const char *a2, ...)
{
  return _[a1 entitled];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return _[a1 errors];
}

id objc_msgSend_establishBluetoothdXPCWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 establishBluetoothdXPCWithCompletion:];
}

id objc_msgSend_evalPreemptiveBannerResult(void *a1, const char *a2, ...)
{
  return _[a1 evalPreemptiveBannerResult];
}

id objc_msgSend_evalResult(void *a1, const char *a2, ...)
{
  return _[a1 evalResult];
}

id objc_msgSend_evalTicks(void *a1, const char *a2, ...)
{
  return _[a1 evalTicks];
}

id objc_msgSend_evalWxMap(void *a1, const char *a2, ...)
{
  return _[a1 evalWxMap];
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return _[a1 evaluator];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_falseRouteCheckForceDisconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckForceDisconnectTimer];
}

id objc_msgSend_falseRouteCheckHijackAwayTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckHijackAwayTimer];
}

id objc_msgSend_falseRouteCheckHijackTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckHijackTimer];
}

id objc_msgSend_falseRouteCheckOnDemandTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckOnDemandTimer];
}

id objc_msgSend_falseRouteCheckOwnLostTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckOwnLostTimer];
}

id objc_msgSend_falseRouteCheckProactiveRoutingTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckProactiveRoutingTimer];
}

id objc_msgSend_falseRouteCheckReason(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckReason];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return _[a1 fd];
}

id objc_msgSend_fetchAADeviceRecordSyncWithAddress_(void *a1, const char *a2, ...)
{
  return [a1 fetchAADeviceRecordSyncWithAddress:];
}

id objc_msgSend_fetchAAProxCardsInfoWithAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchAAProxCardsInfoWithAddress:completion:");
}

id objc_msgSend_fetchAccessoryKeyBlob_(void *a1, const char *a2, ...)
{
  return [a1 fetchAccessoryKeyBlob:];
}

id objc_msgSend_fetchAccountMagicKeysBlobWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchAccountMagicKeysBlobWithCompletion:");
}

id objc_msgSend_fetchAccountStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchAccountStatusWithCompletion:];
}

id objc_msgSend_fetchAllSubscriptionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchAllSubscriptionsWithCompletionHandler:");
}

id objc_msgSend_fetchCached(void *a1, const char *a2, ...)
{
  return _[a1 fetchCached];
}

id objc_msgSend_fetchCloudPairingIdentifierForPeripheral_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchCloudPairingIdentifierForPeripheral:withCompletion:");
}

id objc_msgSend_fetchCountsForFormWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchCountsForFormWithIdentifier:x0 completion:x1];
}

id objc_msgSend_fetchDeviceList(void *a1, const char *a2, ...)
{
  return _[a1 fetchDeviceList];
}

id objc_msgSend_fetchDeviceRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceRecordsWithCompletion:];
}

id objc_msgSend_fetchDeviceSupportInformationRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceSupportInformationRecordWithAddress:x0 completion:x1];
}

id objc_msgSend_fetchDeviceSupportInformationRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceSupportInformationRecordsWithCompletion:];
}

id objc_msgSend_fetchDeviceSyncWithAddress_(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceSyncWithAddress:];
}

id objc_msgSend_fetchDeviceWithAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchDeviceWithAddress:completion:");
}

id objc_msgSend_fetchHMDeviceCloudRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchHMDeviceCloudRecordWithAddress:completion:");
}

id objc_msgSend_fetchIDSDevicesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchIDSDevicesWithCompletion:];
}

id objc_msgSend_fetchInCallUIState_(void *a1, const char *a2, ...)
{
  return [a1 fetchInCallUIState:];
}

id objc_msgSend_fetchKeyBlob_(void *a1, const char *a2, ...)
{
  return [a1 fetchKeyBlob:];
}

id objc_msgSend_fetchLegacyMagicPairingRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchLegacyMagicPairingRecordsWithCompletion:");
}

id objc_msgSend_fetchMagicPairingSettingsRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchMagicPairingSettingsRecordsWithCompletion:];
}

id objc_msgSend_fetchMagicSettingsRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchMagicSettingsRecordWithAddress:completion:");
}

id objc_msgSend_fetchNicknameDevice(void *a1, const char *a2, ...)
{
  return _[a1 fetchNicknameDevice];
}

id objc_msgSend_fetchPublicAddressWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchPublicAddressWithCompletion:];
}

id objc_msgSend_fetchRecordWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchRecordWithID:];
}

id objc_msgSend_fetchSoundProfileRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchSoundProfileRecordWithCompletion:");
}

id objc_msgSend_fetchSubscriptionWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchSubscriptionWithID:completionHandler:];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileDiscovered(void *a1, const char *a2, ...)
{
  return _[a1 fileDiscovered];
}

id objc_msgSend_fileHandleForWritingToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForWritingToURL:error];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_filteredDevicesForIDSDevices_(void *a1, const char *a2, ...)
{
  return [a1 filteredDevicesForIDSDevices:];
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 firmwareVersion];
}

id objc_msgSend_firstBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 firstBannerShown];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPipeMessageRTT(void *a1, const char *a2, ...)
{
  return _[a1 firstPipeMessageRTT];
}

id objc_msgSend_firstPreemptiveBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 firstPreemptiveBannerShown];
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 firstUnlocked];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 forceAccountStatus];
}

id objc_msgSend_generateKeyDictForTypes_keyLength_forAddress_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:");
}

id objc_msgSend_getAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 getAccountStatus];
}

id objc_msgSend_getActiveCategoryVolume_andName_(void *a1, const char *a2, ...)
{
  return [a1 getActiveCategoryVolume:andName:];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getHijackAudioInfo_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return [a1 getHijackAudioInfo:x0 appCount:x1 playingApp:x2 route:x3 remote:x4];
}

id objc_msgSend_getHijackedAwayAudioInfo_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return [a1 getHijackedAwayAudioInfo:x0 appCount:x1 playingApp:x2 route:x3 remote:x4];
}

id objc_msgSend_getLocalAudioInfofromSnapshot_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return [a1 getLocalAudioInfofromSnapshot:x0 appCount:x1 playingApp:x2 route:x3 remote:x4];
}

id objc_msgSend_getSmartRoutingStateForDeviceAddress_(void *a1, const char *a2, ...)
{
  return [a1 getSmartRoutingStateForDeviceAddress:];
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 gracePeriod];
}

id objc_msgSend_handleAccessoryKeyModifyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleAccessoryKeyModifyError:forBlob:withRetryCount:")];
}

id objc_msgSend_handleAccessoryModifyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleAccessoryModifyError:forBlob:withRetryCount:");
}

id objc_msgSend_handleActivity(void *a1, const char *a2, ...)
{
  return _[a1 handleActivity];
}

id objc_msgSend_handleActivityScoreUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleActivityScoreUpdate:");
}

id objc_msgSend_handleCloudPairingMessage_from_(void *a1, const char *a2, ...)
{
  return [a1 handleCloudPairingMessage:x0 from:x1];
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return [a1 handleConnection:];
}

id objc_msgSend_handleConnection_XPCMessage_userID_processID_(void *a1, const char *a2, ...)
{
  return [a1 handleConnection:XPCMessage:userID:processID:];
}

id objc_msgSend_handleDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleDisconnection];
}

id objc_msgSend_handleEvent_(void *a1, const char *a2, ...)
{
  return [a1 handleEvent:];
}

id objc_msgSend_handleInitiatorPairingKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return [a1 handleInitiatorPairingKeys:x0 from:x1 forProtocolID:x2];
}

id objc_msgSend_handleKeyDistribution_from_(void *a1, const char *a2, ...)
{
  return [a1 handleKeyDistribution:from];
}

id objc_msgSend_handleModifyMasterKeyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 handleModifyMasterKeyError:forBlob:withRetryCount:];
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return [a1 handleMsg:];
}

id objc_msgSend_handlePairingFailure_from_(void *a1, const char *a2, ...)
{
  return [a1 handlePairingFailure:from:];
}

id objc_msgSend_handlePairingRequest_from_(void *a1, const char *a2, ...)
{
  return [a1 handlePairingRequest:from:];
}

id objc_msgSend_handlePairingResponse_from_(void *a1, const char *a2, ...)
{
  return [a1 handlePairingResponse:from:];
}

id objc_msgSend_handleRepairRequest_from_(void *a1, const char *a2, ...)
{
  return [a1 handleRepairRequest:from:];
}

id objc_msgSend_handleResponderPairingKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return [a1 handleResponderPairingKeys:x0 from:x1 forProtocolID:x2];
}

id objc_msgSend_handleSecurityRequest_from_(void *a1, const char *a2, ...)
{
  return [a1 handleSecurityRequest:from:];
}

id objc_msgSend_handleUnpairCommand_from_(void *a1, const char *a2, ...)
{
  return [a1 handleUnpairCommand:from:];
}

id objc_msgSend_hardwareAddressData(void *a1, const char *a2, ...)
{
  return _[a1 hardwareAddressData];
}

id objc_msgSend_hasOwnership(void *a1, const char *a2, ...)
{
  return _[a1 hasOwnership];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_headGesture(void *a1, const char *a2, ...)
{
  return _[a1 headGesture];
}

id objc_msgSend_headGestureMode(void *a1, const char *a2, ...)
{
  return _[a1 headGestureMode];
}

id objc_msgSend_headGestureToggle(void *a1, const char *a2, ...)
{
  return _[a1 headGestureToggle];
}

id objc_msgSend_headGestureUpdateFlags(void *a1, const char *a2, ...)
{
  return _[a1 headGestureUpdateFlags];
}

id objc_msgSend_hearingAidEnrolled(void *a1, const char *a2, ...)
{
  return _[a1 hearingAidEnrolled];
}

id objc_msgSend_hearingAidToggle(void *a1, const char *a2, ...)
{
  return _[a1 hearingAidToggle];
}

id objc_msgSend_hijackActiveRemoteScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackActiveRemoteScore];
}

id objc_msgSend_hijackAmbientTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackAmbientTick];
}

id objc_msgSend_hijackAnswer(void *a1, const char *a2, ...)
{
  return _[a1 hijackAnswer];
}

id objc_msgSend_hijackAwayLocalScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackAwayLocalScore];
}

id objc_msgSend_hijackAwayRemoteScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackAwayRemoteScore];
}

id objc_msgSend_hijackBackoffTicks(void *a1, const char *a2, ...)
{
  return _[a1 hijackBackoffTicks];
}

id objc_msgSend_hijackBlockingClientSet(void *a1, const char *a2, ...)
{
  return _[a1 hijackBlockingClientSet];
}

id objc_msgSend_hijackCallTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackCallTick];
}

id objc_msgSend_hijackContinuousTimeoutCount(void *a1, const char *a2, ...)
{
  return _[a1 hijackContinuousTimeoutCount];
}

id objc_msgSend_hijackInputTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackInputTick];
}

id objc_msgSend_hijackMediaTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackMediaTick];
}

id objc_msgSend_hijackPlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 hijackPlayingApp];
}

id objc_msgSend_hijackPlayingCategory(void *a1, const char *a2, ...)
{
  return _[a1 hijackPlayingCategory];
}

id objc_msgSend_hijackRelaySent(void *a1, const char *a2, ...)
{
  return _[a1 hijackRelaySent];
}

id objc_msgSend_hijackRoundTripTime(void *a1, const char *a2, ...)
{
  return _[a1 hijackRoundTripTime];
}

id objc_msgSend_hijackScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackScore];
}

id objc_msgSend_hijackVersion(void *a1, const char *a2, ...)
{
  return _[a1 hijackVersion];
}

id objc_msgSend_hmDeviceCloudRecordInfo(void *a1, const char *a2, ...)
{
  return _[a1 hmDeviceCloudRecordInfo];
}

id objc_msgSend_hmDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hmDeviceCloudRecordInfosUpdated:");
}

id objc_msgSend_iCloudAccount(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsDevice(void *a1, const char *a2, ...)
{
  return _[a1 idsDevice];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsIdentifier];
}

id objc_msgSend_ignoreManualConnect(void *a1, const char *a2, ...)
{
  return _[a1 ignoreManualConnect];
}

id objc_msgSend_inEar(void *a1, const char *a2, ...)
{
  return _[a1 inEar];
}

id objc_msgSend_inEarDisabled(void *a1, const char *a2, ...)
{
  return _[a1 inEarDisabled];
}

id objc_msgSend_inUseBannerBackoffReason(void *a1, const char *a2, ...)
{
  return _[a1 inUseBannerBackoffReason];
}

id objc_msgSend_inUseBannerBackoffTick(void *a1, const char *a2, ...)
{
  return _[a1 inUseBannerBackoffTick];
}

id objc_msgSend_inUseBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 inUseBannerShown];
}

id objc_msgSend_incomingCallRingtone(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallRingtone];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initProxyForProcess_(void *a1, const char *a2, ...)
{
  return [a1 initProxyForProcess:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return [a1 initWithBluetoothAddress:];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithCameraSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithCameraSession:];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithContentIdentifier_context_osBuild_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentIdentifier:x0 context:x1 osBuild:x2 userInfo:x3];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDelegate_config_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:v1 config:v2];
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:error:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_initWithFeedbackForm_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedbackForm:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithIDSDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithIDSDevice:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithIdentifier_bundleID_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 bundleID:x1 context:x2];
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 initWithListenerEndpoint:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithName_date_gracePeriod_priority_options_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 date:x1 gracePeriod:x2 priority:x3 options:x4 block:x5];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithRecordIDs_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordIDs:];
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordName:zoneID:];
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordType:recordID:];
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordZonesToSave:x0 recordZoneIDsToDelete:x1];
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordsToSave:recordIDsToSave recordIDsToDelete:recordIDsToDelete];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithURL_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:action:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUserNotification_sourceAppId_platform_(void *a1, const char *a2, ...)
{
  return [a1 initWithUserNotification:x0 sourceAppId:x1 platform:x2];
}

id objc_msgSend_initWithXPCObject_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithXPCObject:x0 error:x1];
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithZoneID:];
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return [a1 initWithZoneName:];
}

id objc_msgSend_initializeCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 initializeCloudKit];
}

id objc_msgSend_initializeIDS(void *a1, const char *a2, ...)
{
  return _[a1 initializeIDS];
}

id objc_msgSend_initializedCKAfterFirstUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 initializedCKAfterFirstUnlockedSinceBoot];
}

id objc_msgSend_initiatePairing_(void *a1, const char *a2, ...)
{
  return [a1 initiatePairing:];
}

id objc_msgSend_initiatePairingAgainIfNoAckReceived_attempt_(void *a1, const char *a2, ...)
{
  return [a1 initiatePairingAgainIfNoAckReceived:attempt:];
}

id objc_msgSend_inquiryState(void *a1, const char *a2, ...)
{
  return _[a1 inquiryState];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalFlags(void *a1, const char *a2, ...)
{
  return _[a1 internalFlags];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAudioSessionControl_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "invalidateAudioSessionControl:completion:");
}

id objc_msgSend_isAccountActive(void *a1, const char *a2, ...)
{
  return _[a1 isAccountActive];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBuddyComplete(void *a1, const char *a2, ...)
{
  return _[a1 isBuddyComplete];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isDeviceClass_(void *a1, const char *a2, ...)
{
  return [a1 isDeviceClass:];
}

id objc_msgSend_isEndpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 isEndpointOnCurrentDevice];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDate:];
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToIgnoringCase:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFetchInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isFetchInProgress];
}

id objc_msgSend_isFetchMasterKeyInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isFetchMasterKeyInProgress];
}

id objc_msgSend_isFirstConnectionAfterSREnable(void *a1, const char *a2, ...)
{
  return _[a1 isFirstConnectionAfterSREnable];
}

id objc_msgSend_isFirstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isFirstUnlocked];
}

id objc_msgSend_isHSATrusted(void *a1, const char *a2, ...)
{
  return _[a1 isHSATrusted];
}

id objc_msgSend_isInAnyTipi(void *a1, const char *a2, ...)
{
  return _[a1 isInAnyTipi];
}

id objc_msgSend_isInEar(void *a1, const char *a2, ...)
{
  return _[a1 isInEar];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _[a1 isIncoming];
}

id objc_msgSend_isMicIndicatorVisible(void *a1, const char *a2, ...)
{
  return _[a1 isMicIndicatorVisible];
}

id objc_msgSend_isMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 isMonitoring];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isNetworkUp(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkUp];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 isOutgoing];
}

id objc_msgSend_isPTT(void *a1, const char *a2, ...)
{
  return _[a1 isPTT];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return _[a1 isReady];
}

id objc_msgSend_isRoutingActionInitialized(void *a1, const char *a2, ...)
{
  return _[a1 isRoutingActionInitialized];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSystemProvider];
}

id objc_msgSend_isTipiHealingV2Eligible(void *a1, const char *a2, ...)
{
  return _[a1 isTipiHealingV2Eligible];
}

id objc_msgSend_isUTPConnected(void *a1, const char *a2, ...)
{
  return _[a1 isUTPConnected];
}

id objc_msgSend_isWatchingBuddy(void *a1, const char *a2, ...)
{
  return _[a1 isWatchingBuddy];
}

id objc_msgSend_isWriteMasterKeysInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isWriteMasterKeysInProgress];
}

id objc_msgSend_keyLength(void *a1, const char *a2, ...)
{
  return _[a1 keyLength];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 lastBatteryLevel];
}

id objc_msgSend_lastBatteryType(void *a1, const char *a2, ...)
{
  return _[a1 lastBatteryType];
}

id objc_msgSend_lastConnectHost(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectHost];
}

id objc_msgSend_lastConnectResult(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectResult];
}

id objc_msgSend_lastConnectTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectTicks];
}

id objc_msgSend_lastConnectionTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectionTicks];
}

id objc_msgSend_lastEvalResult(void *a1, const char *a2, ...)
{
  return _[a1 lastEvalResult];
}

id objc_msgSend_lastEvalTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastEvalTicks];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPlay(void *a1, const char *a2, ...)
{
  return _[a1 lastPlay];
}

id objc_msgSend_lastSeenTime(void *a1, const char *a2, ...)
{
  return _[a1 lastSeenTime];
}

id objc_msgSend_lastWxAdvTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastWxAdvTicks];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lidClosed(void *a1, const char *a2, ...)
{
  return _[a1 lidClosed];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return _[a1 listeningMode];
}

id objc_msgSend_listeningModeConfigs(void *a1, const char *a2, ...)
{
  return _[a1 listeningModeConfigs];
}

id objc_msgSend_listeningModeOffAllowed(void *a1, const char *a2, ...)
{
  return _[a1 listeningModeOffAllowed];
}

id objc_msgSend_localAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 localAudioScore];
}

id objc_msgSend_localDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceName];
}

id objc_msgSend_localDeviceRandomAddress(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceRandomAddress];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStandardContainsString_(void *a1, const char *a2, ...)
{
  return [a1 localizedStandardContainsString:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2];
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2 localization:x3];
}

id objc_msgSend_locationCategory(void *a1, const char *a2, ...)
{
  return _[a1 locationCategory];
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_lowestBudBatteryInfo(void *a1, const char *a2, ...)
{
  return _[a1 lowestBudBatteryInfo];
}

id objc_msgSend_magnetConnected(void *a1, const char *a2, ...)
{
  return _[a1 magnetConnected];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_manateeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 manateeAvailable];
}

id objc_msgSend_manateeZoneAvailable(void *a1, const char *a2, ...)
{
  return _[a1 manateeZoneAvailable];
}

id objc_msgSend_manateeZoneUpgraded(void *a1, const char *a2, ...)
{
  return _[a1 manateeZoneUpgraded];
}

id objc_msgSend_manualRouteChangeDetectionTimer(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteChangeDetectionTimer];
}

id objc_msgSend_manualRouteChangeInProgress(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteChangeInProgress];
}

id objc_msgSend_manualRouteDestination(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteDestination];
}

id objc_msgSend_manualRouteInputOutput(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteInputOutput];
}

id objc_msgSend_manualRouteUISource(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteUISource];
}

id objc_msgSend_manuallyRouted(void *a1, const char *a2, ...)
{
  return _[a1 manuallyRouted];
}

id objc_msgSend_markLegacyNonManateeContainerMigrated(void *a1, const char *a2, ...)
{
  return _[a1 markLegacyNonManateeContainerMigrated];
}

id objc_msgSend_masterBlob(void *a1, const char *a2, ...)
{
  return _[a1 masterBlob];
}

id objc_msgSend_mediaPlaying(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlaying];
}

id objc_msgSend_messageIdentifiersWaitingForAck(void *a1, const char *a2, ...)
{
  return _[a1 messageIdentifiersWaitingForAck];
}

id objc_msgSend_microphoneMode(void *a1, const char *a2, ...)
{
  return _[a1 microphoneMode];
}

id objc_msgSend_minRSSIHeadset(void *a1, const char *a2, ...)
{
  return _[a1 minRSSIHeadset];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_modifiedByDevice(void *a1, const char *a2, ...)
{
  return _[a1 modifiedByDevice];
}

id objc_msgSend_modifyAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "modifyAccessoryBlob:withRetryCount:");
}

id objc_msgSend_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 modifyDevice:x0 connectionPriorityDevices:x1 timeoutSeconds:x2 completionHandler:x3];
}

id objc_msgSend_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:");
}

id objc_msgSend_modifyDevice_settings_completion_(void *a1, const char *a2, ...)
{
  return [a1 modifyDevice:settings:completion:];
}

id objc_msgSend_modifyKeyBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 modifyKeyBlob:x0 withRetryCount:x1];
}

id objc_msgSend_modifyOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 modifyOperationQueue];
}

id objc_msgSend_modifyOperationTimer(void *a1, const char *a2, ...)
{
  return _[a1 modifyOperationTimer];
}

id objc_msgSend_monitorBuddyStateWithAction_(void *a1, const char *a2, ...)
{
  return [a1 monitorBuddyStateWithAction:];
}

id objc_msgSend_monitorFirstUnlockWithAction_(void *a1, const char *a2, ...)
{
  return [a1 monitorFirstUnlockWithAction:];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_muteControlConfig(void *a1, const char *a2, ...)
{
  return _[a1 muteControlConfig];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nearbyConnectedSourceCount(void *a1, const char *a2, ...)
{
  return _[a1 nearbyConnectedSourceCount];
}

id objc_msgSend_nearbyDeviceNoTipiScoreCount(void *a1, const char *a2, ...)
{
  return _[a1 nearbyDeviceNoTipiScoreCount];
}

id objc_msgSend_nearbyInEar(void *a1, const char *a2, ...)
{
  return _[a1 nearbyInEar];
}

id objc_msgSend_nearbyLastRouteHost(void *a1, const char *a2, ...)
{
  return _[a1 nearbyLastRouteHost];
}

id objc_msgSend_nearbyName(void *a1, const char *a2, ...)
{
  return _[a1 nearbyName];
}

id objc_msgSend_nearbyOutOfCaseTime(void *a1, const char *a2, ...)
{
  return _[a1 nearbyOutOfCaseTime];
}

id objc_msgSend_nearbyPrevInEar(void *a1, const char *a2, ...)
{
  return _[a1 nearbyPrevInEar];
}

id objc_msgSend_nearbyProductID(void *a1, const char *a2, ...)
{
  return _[a1 nearbyProductID];
}

id objc_msgSend_nearbyStreamState(void *a1, const char *a2, ...)
{
  return _[a1 nearbyStreamState];
}

id objc_msgSend_nearbyWxDevice(void *a1, const char *a2, ...)
{
  return _[a1 nearbyWxDevice];
}

id objc_msgSend_nearbyiCloudSignIn(void *a1, const char *a2, ...)
{
  return _[a1 nearbyiCloudSignIn];
}

id objc_msgSend_needsSetup(void *a1, const char *a2, ...)
{
  return _[a1 needsSetup];
}

id objc_msgSend_needsUpdateToAAController(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdateToAAController];
}

id objc_msgSend_needsUpdateToDeviceCloudRecord(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdateToDeviceCloudRecord];
}

id objc_msgSend_networkMonitor(void *a1, const char *a2, ...)
{
  return _[a1 networkMonitor];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_nicknameDevice(void *a1, const char *a2, ...)
{
  return _[a1 nicknameDevice];
}

id objc_msgSend_noNearbyDeviceFoundCount(void *a1, const char *a2, ...)
{
  return _[a1 noNearbyDeviceFoundCount];
}

id objc_msgSend_noiseLevel(void *a1, const char *a2, ...)
{
  return _[a1 noiseLevel];
}

id objc_msgSend_notificationFromRemoteNotificationDictionary_(void *a1, const char *a2, ...)
{
  return [a1 notificationFromRemoteNotificationDictionary:];
}

id objc_msgSend_notificationWithRequest_date_sourceIdentifier_intentIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 notificationWithRequest:x0 date:x1 sourceIdentifier:x2 intentIdentifiers:x3];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return _[a1 nsuuid];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_onDemandCategory(void *a1, const char *a2, ...)
{
  return _[a1 onDemandCategory];
}

id objc_msgSend_oneSourceLastRouteHost(void *a1, const char *a2, ...)
{
  return _[a1 oneSourceLastRouteHost];
}

id objc_msgSend_opaqueSessionID(void *a1, const char *a2, ...)
{
  return _[a1 opaqueSessionID];
}

id objc_msgSend_openRadarforAudioQuality(void *a1, const char *a2, ...)
{
  return _[a1 openRadarforAudioQuality];
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 configuration:x1 completionHandler:x2];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersion];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_otherTipiAudioCategory(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiAudioCategory];
}

id objc_msgSend_otherTipiDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceAudioScore];
}

id objc_msgSend_otherTipiDeviceBTAddress(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceBTAddress];
}

id objc_msgSend_otherTipiDeviceBTName(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceBTName];
}

id objc_msgSend_otherTipiDeviceIdleTick(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceIdleTick];
}

id objc_msgSend_otherTipiDeviceIsWatch(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceIsWatch];
}

id objc_msgSend_otherTipiDeviceLastPlay(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceLastPlay];
}

id objc_msgSend_otherTipiDeviceMajorBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceMajorBuildVersion];
}

id objc_msgSend_otherTipiDeviceMinorBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceMinorBuildVersion];
}

id objc_msgSend_otherTipiDevicePlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDevicePlayingApp];
}

id objc_msgSend_otherTipiDeviceVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceVersion];
}

id objc_msgSend_otherTipiManuallyRouteTicks(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiManuallyRouteTicks];
}

id objc_msgSend_outOfCaseTime(void *a1, const char *a2, ...)
{
  return _[a1 outOfCaseTime];
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return _[a1 outputVoice];
}

id objc_msgSend_overrideScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 overrideScreenOff];
}

id objc_msgSend_pairSetupWithFlags_completion_(void *a1, const char *a2, ...)
{
  return [a1 pairSetupWithFlags:];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return _[a1 paired];
}

id objc_msgSend_pairingDeriveKeyForIdentifier_keyLength_(void *a1, const char *a2, ...)
{
  return [a1 pairingDeriveKeyForIdentifier:x0 keyLength:x1];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pauseErrorReason(void *a1, const char *a2, ...)
{
  return _[a1 pauseErrorReason];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_performRequestWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 performRequestWithCompletion:];
}

id objc_msgSend_pipePendingRequest(void *a1, const char *a2, ...)
{
  return _[a1 pipePendingRequest];
}

id objc_msgSend_pipeStartTime(void *a1, const char *a2, ...)
{
  return _[a1 pipeStartTime];
}

id objc_msgSend_placementMode(void *a1, const char *a2, ...)
{
  return _[a1 placementMode];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_predictiveRouteTicks(void *a1, const char *a2, ...)
{
  return _[a1 predictiveRouteTicks];
}

id objc_msgSend_preemptiveBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 preemptiveBannerShown];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:x0 forPreferences:x1];
}

id objc_msgSend_primaryAppleIDIsHSA2(void *a1, const char *a2, ...)
{
  return _[a1 primaryAppleIDIsHSA2];
}

id objc_msgSend_primaryInCase(void *a1, const char *a2, ...)
{
  return _[a1 primaryInCase];
}

id objc_msgSend_primaryInEar(void *a1, const char *a2, ...)
{
  return _[a1 primaryInEar];
}

id objc_msgSend_primaryPlacement(void *a1, const char *a2, ...)
{
  return _[a1 primaryPlacement];
}

id objc_msgSend_printDebug(void *a1, const char *a2, ...)
{
  return _[a1 printDebug];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_proactiveRoutingBackoff(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingBackoff];
}

id objc_msgSend_proactiveRoutingTrigger(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingTrigger];
}

id objc_msgSend_proactiveRoutingWxRSSI(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingWxRSSI];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processingIDSPush(void *a1, const char *a2, ...)
{
  return _[a1 processingIDSPush];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 productBuildVersion];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 productIdentifier];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _[a1 productName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_progressStarted(void *a1, const char *a2, ...)
{
  return _[a1 progressStarted];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_publicAddress(void *a1, const char *a2, ...)
{
  return _[a1 publicAddress];
}

id objc_msgSend_publicAddressForIDSDevice_(void *a1, const char *a2, ...)
{
  return [a1 publicAddressForIDSDevice:];
}

id objc_msgSend_pushEnable(void *a1, const char *a2, ...)
{
  return _[a1 pushEnable];
}

id objc_msgSend_pushQueue(void *a1, const char *a2, ...)
{
  return _[a1 pushQueue];
}

id objc_msgSend_pushTimer(void *a1, const char *a2, ...)
{
  return _[a1 pushTimer];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:x0 options:x1];
}

id objc_msgSend_readUserPreference_(void *a1, const char *a2, ...)
{
  return [a1 readUserPreference:];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reconnectionState(void *a1, const char *a2, ...)
{
  return _[a1 reconnectionState];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return _[a1 recordType];
}

id objc_msgSend_recordZoneAccessoryDatabase(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneAccessoryDatabase];
}

id objc_msgSend_recordZoneBlob(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneBlob];
}

id objc_msgSend_recordZoneID(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneID];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerRequestID:options:handler:];
}

id objc_msgSend_registrationStatus(void *a1, const char *a2, ...)
{
  return _[a1 registrationStatus];
}

id objc_msgSend_reinitAfterBuddy(void *a1, const char *a2, ...)
{
  return _[a1 reinitAfterBuddy];
}

id objc_msgSend_relinquishAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 relinquishAudioRoute];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remotePID(void *a1, const char *a2, ...)
{
  return _[a1 remotePID];
}

id objc_msgSend_remoteUID(void *a1, const char *a2, ...)
{
  return _[a1 remoteUID];
}

id objc_msgSend_removeAAProxCardsInfoWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeAAProxCardsInfoWithBluetoothAddress:completion:")
}

id objc_msgSend_removeAllActions(void *a1, const char *a2, ...)
{
  return _[a1 removeAllActions];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeConnection_(void *a1, const char *a2, ...)
{
  return [a1 removeConnection:];
}

id objc_msgSend_removeDeviceMagicSettingsWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeDeviceMagicSettingsWithBluetoothAddress:x0 completion:x1];
}

id objc_msgSend_removeDeviceNickname(void *a1, const char *a2, ...)
{
  return _[a1 removeDeviceNickname];
}

id objc_msgSend_removeDeviceSupportInformationWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeDeviceSupportInformationWithBluetoothAddress:completion:");
}

id objc_msgSend_removeDeviceWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeDeviceWithBluetoothAddress:x0 completion:x1];
}

id objc_msgSend_removeDeviceWithRecord_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeDeviceWithRecord:completion:");
}

id objc_msgSend_removeHMDeviceCloudRecordWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeHMDeviceCloudRecordWithBluetoothAddress:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:context:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeSoundProfileRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 removeSoundProfileRecordWithCompletion:];
}

id objc_msgSend_removeWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 removeWithDelegate:];
}

id objc_msgSend_removeuserPreference_sync_(void *a1, const char *a2, ...)
{
  return [a1 removeuserPreference:sync:];
}

id objc_msgSend_reportDeviceFound_(void *a1, const char *a2, ...)
{
  return [a1 reportDeviceFound:];
}

id objc_msgSend_reportDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 reportDeviceLost:];
}

id objc_msgSend_reportHMDeviceCloudRecordInfosRemoved_(void *a1, const char *a2, ...)
{
  return [a1 reportHMDeviceCloudRecordInfosRemoved:];
}

id objc_msgSend_reportHMDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return [a1 reportHMDeviceCloudRecordInfosUpdated:];
}

id objc_msgSend_reportHeadGestureDetected_(void *a1, const char *a2, ...)
{
  return [a1 reportHeadGestureDetected:];
}

id objc_msgSend_reportTime(void *a1, const char *a2, ...)
{
  return _[a1 reportTime];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:];
}

id objc_msgSend_requestedKeyTypes(void *a1, const char *a2, ...)
{
  return _[a1 requestedKeyTypes];
}

id objc_msgSend_resetAccessoryZone_(void *a1, const char *a2, ...)
{
  return [a1 resetAccessoryZone:];
}

id objc_msgSend_resetCachedData(void *a1, const char *a2, ...)
{
  return _[a1 resetCachedData];
}

id objc_msgSend_resetCachedDataWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "resetCachedDataWithCompletion:");
}

id objc_msgSend_resetCloudContainerManateeIdentityLost(void *a1, const char *a2, ...)
{
  return _[a1 resetCloudContainerManateeIdentityLost];
}

id objc_msgSend_resetCloudDataWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 resetCloudDataWithCompletion:];
}

id objc_msgSend_resetOldZones(void *a1, const char *a2, ...)
{
  return _[a1 resetOldZones];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return _[a1 responseHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryIDSSetup(void *a1, const char *a2, ...)
{
  return _[a1 retryIDSSetup];
}

id objc_msgSend_reverseRouteReason(void *a1, const char *a2, ...)
{
  return _[a1 reverseRouteReason];
}

id objc_msgSend_roleWithDevice_(void *a1, const char *a2, ...)
{
  return [a1 roleWithDevice:];
}

id objc_msgSend_routeCheckHijackTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckHijackTimer];
}

id objc_msgSend_routeCheckInUseBannerTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckInUseBannerTimer];
}

id objc_msgSend_routeCheckOnDemandTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckOnDemandTimer];
}

id objc_msgSend_routeCheckOwnLostTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckOwnLostTimer];
}

id objc_msgSend_routed(void *a1, const char *a2, ...)
{
  return _[a1 routed];
}

id objc_msgSend_routingAction(void *a1, const char *a2, ...)
{
  return _[a1 routingAction];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_rssiEstimate(void *a1, const char *a2, ...)
{
  return _[a1 rssiEstimate];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveRecord_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveRecord:x0 completionHandler:x1];
}

id objc_msgSend_saveRecordZone_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveRecordZone:completionHandler:];
}

id objc_msgSend_saveSubscription_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveSubscription:x0 completionHandler:x1];
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _[a1 scanRate];
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return [a1 scheduleSendBarrierBlock:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:x0 target:x1 selector:x2 userInfo:x3 repeats:x4];
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return _[a1 screenLocked];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _[a1 screenOn];
}

id objc_msgSend_secondaryInCase(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInCase];
}

id objc_msgSend_secondaryInEar(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInEar];
}

id objc_msgSend_secondaryPlacement(void *a1, const char *a2, ...)
{
  return _[a1 secondaryPlacement];
}

id objc_msgSend_selectiveSpeechListeningConfig(void *a1, const char *a2, ...)
{
  return _[a1 selectiveSpeechListeningConfig];
}

id objc_msgSend_sendCloudKitMsg_args_(void *a1, const char *a2, ...)
{
  return [a1 sendCloudKitMsg:args];
}

id objc_msgSend_sendCloudKitMsg_args_withReply_(void *a1, const char *a2, ...)
{
  return [a1 sendCloudKitMsg:x0, x1, x2];
}

id objc_msgSend_sendCloudKitMsg_argsObject_(void *a1, const char *a2, ...)
{
  return [a1 sendCloudKitMsg:argsObject:];
}

id objc_msgSend_sendCloudKitPush(void *a1, const char *a2, ...)
{
  return _[a1 sendCloudKitPush];
}

id objc_msgSend_sendCloudPairingResponseMessage_toDevice_version_(void *a1, const char *a2, ...)
{
  return [a1 sendCloudPairingResponseMessage:toDevice:version:];
}

id objc_msgSend_sendConversationDetectMessage_destinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendConversationDetectMessage:destinationIdentifier:completionHandler:];
}

id objc_msgSend_sendDeviceConfig_destinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendDeviceConfig:x0 destinationIdentifier:x1 completionHandler:x2];
}

id objc_msgSend_sendDeviceConfig_identifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendDeviceConfig:identifier:completion:];
}

id objc_msgSend_sendErrorMessageToDevice_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendErrorMessageToDevice:reason:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:];
}

id objc_msgSend_sendGetTipiTableMessageToDestinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendGetTipiTableMessageToDestinationIdentifier:completionHandler:");
}

id objc_msgSend_sendInitialPairingIDSMessage_forDevice_withRole_(void *a1, const char *a2, ...)
{
  return [a1 sendInitialPairingIDSMessage:forDevice:withRole:];
}

id objc_msgSend_sendMessage_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:x0 fromAccount:x1 toDestinations:x2 priority:x3 options:x4 identifier:x5 error:x6];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return [a1 sendMsg:args:];
}

id objc_msgSend_sendRePairCloudPairingMessage_toDevice_bundleID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendRePairCloudPairingMessage:toDevice:bundleID:");
}

id objc_msgSend_sendRePairRequest_forBundleID_(void *a1, const char *a2, ...)
{
  return [a1 sendRePairRequest:forBundleID:];
}

id objc_msgSend_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRelayMessageType:x0 messageData:x1 conduitDevice:x2 destinationDevice:x3 completionHandler:x4];
}

id objc_msgSend_sendRequestID_options_request_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:options:request:responseHandler:];
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_sendSmartRoutingInformation_device_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendSmartRoutingInformation:device completionHandler:];
}

id objc_msgSend_senderIDS(void *a1, const char *a2, ...)
{
  return _[a1 senderIDS];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _[a1 serverConnection];
}

id objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "serverPreferredPushEnvironmentWithCompletionHandler:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_service_activeAccountsChanged_(void *a1, const char *a2, ...)
{
  return [a1 service:activeAccountsChanged:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAaDeviceDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setAaDeviceDelegate:];
}

id objc_msgSend_setAcceptReplyPlayPauseConfig_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptReplyPlayPauseConfig:];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return [a1 setAccount:];
}

id objc_msgSend_setAccountAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setAccountAvailable:];
}

id objc_msgSend_setAclPriority_(void *a1, const char *a2, ...)
{
  return [a1 setAclPriority:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActionHandler:];
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return [a1 setActive:error:];
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 setActive:withOptions:error:];
}

id objc_msgSend_setActivePlayingApp_(void *a1, const char *a2, ...)
{
  return [a1 setActivePlayingApp:];
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return [a1 setActivity:];
}

id objc_msgSend_setAdaptiveVolumeConfig_(void *a1, const char *a2, ...)
{
  return [a1 setAdaptiveVolumeConfig:];
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return [a1 setAddress:];
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiseRate:];
}

id objc_msgSend_setAggregate_(void *a1, const char *a2, ...)
{
  return [a1 setAggregate:];
}

id objc_msgSend_setAllowOffListeningMode_(void *a1, const char *a2, ...)
{
  return [a1 setAllowOffListeningMode:];
}

id objc_msgSend_setAllowsAutoRoute_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAutoRoute:];
}

id objc_msgSend_setAssociatedDevices_(void *a1, const char *a2, ...)
{
  return [a1 setAssociatedDevices:];
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttribute:forKey:error:];
}

id objc_msgSend_setAudioDestination_(void *a1, const char *a2, ...)
{
  return [a1 setAudioDestination:];
}

id objc_msgSend_setAudioFeedbackConfig_(void *a1, const char *a2, ...)
{
  return [a1 setAudioFeedbackConfig:];
}

id objc_msgSend_setAudioRoute_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoute:];
}

id objc_msgSend_setAudioRouteHidden_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRouteHidden:];
}

id objc_msgSend_setAudioRoutingClientID_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingClientID:];
}

id objc_msgSend_setAudioRoutingRequest_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingRequest:];
}

id objc_msgSend_setAudioRoutingResponse_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingResponse:];
}

id objc_msgSend_setAudioRoutingScore_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingScore:];
}

id objc_msgSend_setAudioRoutingScore_completion_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingScore:x0 completion:x1];
}

id objc_msgSend_setAudioSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setAudioSessionID:];
}

id objc_msgSend_setAudioState_(void *a1, const char *a2, ...)
{
  return [a1 setAudioState:];
}

id objc_msgSend_setAudiogramEnrolledTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setAudiogramEnrolledTimestamp:];
}

id objc_msgSend_setAuthenticationMethod_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationMethod:];
}

id objc_msgSend_setAutoANCStrength_(void *a1, const char *a2, ...)
{
  return [a1 setAutoANCStrength:];
}

id objc_msgSend_setBannerAction_(void *a1, const char *a2, ...)
{
  return [a1 setBannerAction:];
}

id objc_msgSend_setBannerAppID_(void *a1, const char *a2, ...)
{
  return [a1 setBannerAppID:];
}

id objc_msgSend_setBannerTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setBannerTrigger:];
}

id objc_msgSend_setBannerType_(void *a1, const char *a2, ...)
{
  return [a1 setBannerType:];
}

id objc_msgSend_setBatteryLeft_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryLeft:];
}

id objc_msgSend_setBatteryLevelInfo_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryLevelInfo:];
}

id objc_msgSend_setBatteryMain_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryMain:];
}

id objc_msgSend_setBatteryRight_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryRight:];
}

id objc_msgSend_setBleClientUseCase_(void *a1, const char *a2, ...)
{
  return [a1 setBleClientUseCase:];
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return [a1 setBlock:];
}

id objc_msgSend_setBluetoothIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothIdentifier:];
}

id objc_msgSend_setBluetoothState_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothState:];
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothStateChangedHandler:];
}

id objc_msgSend_setBodyArguments_(void *a1, const char *a2, ...)
{
  return [a1 setBodyArguments:];
}

id objc_msgSend_setBodyKey_(void *a1, const char *a2, ...)
{
  return [a1 setBodyKey:];
}

id objc_msgSend_setBtXID_(void *a1, const char *a2, ...)
{
  return [a1 setBtXID:];
}

id objc_msgSend_setBuddyStateWatcher_(void *a1, const char *a2, ...)
{
  return [a1 setBuddyStateWatcher:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setCDTunings_(void *a1, const char *a2, ...)
{
  return [a1 setCDTunings:];
}

id objc_msgSend_setCPAddressMapping_(void *a1, const char *a2, ...)
{
  return [a1 setCPAddressMapping:];
}

id objc_msgSend_setCallChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCallChangedHandler:];
}

id objc_msgSend_setCallConnected_(void *a1, const char *a2, ...)
{
  return [a1 setCallConnected:];
}

id objc_msgSend_setCallIncomingUnconnected_(void *a1, const char *a2, ...)
{
  return [a1 setCallIncomingUnconnected:];
}

id objc_msgSend_setCallStartTicks_(void *a1, const char *a2, ...)
{
  return [a1 setCallStartTicks:];
}

id objc_msgSend_setCallbackQueue_(void *a1, const char *a2, ...)
{
  return [a1 setCallbackQueue:];
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:withOptions:error:];
}

id objc_msgSend_setCategoryID_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryID:];
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryIdentifier:];
}

id objc_msgSend_setCdSignalAudioInterrupted_(void *a1, const char *a2, ...)
{
  return [a1 setCdSignalAudioInterrupted:];
}

id objc_msgSend_setCenterContentItemsIcon_(void *a1, const char *a2, ...)
{
  return [a1 setCenterContentItemsIcon:];
}

id objc_msgSend_setCenterContentItemsText_(void *a1, const char *a2, ...)
{
  return [a1 setCenterContentItemsText:];
}

id objc_msgSend_setCenterContentText_(void *a1, const char *a2, ...)
{
  return [a1 setCenterContentText:];
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return [a1 setChangeFlags:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClickHoldModeLeft_(void *a1, const char *a2, ...)
{
  return [a1 setClickHoldModeLeft:];
}

id objc_msgSend_setClickHoldModeRight_(void *a1, const char *a2, ...)
{
  return [a1 setClickHoldModeRight:];
}

id objc_msgSend_setClientID_(void *a1, const char *a2, ...)
{
  return [a1 setClientID:];
}

id objc_msgSend_setClientQueue_(void *a1, const char *a2, ...)
{
  return [a1 setClientQueue:];
}

id objc_msgSend_setCloudIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCloudIdentifier:];
}

id objc_msgSend_setCloudKitConnection_(void *a1, const char *a2, ...)
{
  return [a1 setCloudKitConnection:];
}

id objc_msgSend_setCloudPairingQueue_(void *a1, const char *a2, ...)
{
  return [a1 setCloudPairingQueue:];
}

id objc_msgSend_setCloudSubscription_(void *a1, const char *a2, ...)
{
  return [a1 setCloudSubscription:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setConduitDeviceID_(void *a1, const char *a2, ...)
{
  return [a1 setConduitDeviceID:];
}

id objc_msgSend_setConduitMessageTicks_(void *a1, const char *a2, ...)
{
  return [a1 setConduitMessageTicks:];
}

id objc_msgSend_setConduitMessageTimer_(void *a1, const char *a2, ...)
{
  return [a1 setConduitMessageTimer:];
}

id objc_msgSend_setConferencingCallSets_(void *a1, const char *a2, ...)
{
  return [a1 setConferencingCallSets:];
}

id objc_msgSend_setConfigRequestHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConfigRequestHandler:];
}

id objc_msgSend_setConnectOnly_(void *a1, const char *a2, ...)
{
  return [a1 setConnectOnly:];
}

id objc_msgSend_setConnectRequestHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConnectRequestHandler:];
}

id objc_msgSend_setConnectTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setConnectTimeoutSeconds:];
}

id objc_msgSend_setConnected_(void *a1, const char *a2, ...)
{
  return [a1 setConnected:];
}

id objc_msgSend_setConnectionFlags_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionFlags:];
}

id objc_msgSend_setContextChangeFlags_(void *a1, const char *a2, ...)
{
  return [a1 setContextChangeFlags:];
}

id objc_msgSend_setContextSignalUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setContextSignalUpdatedHandler:];
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 setControlFlags:];
}

id objc_msgSend_setConversationDetectConfig_(void *a1, const char *a2, ...)
{
  return [a1 setConversationDetectConfig:];
}

id objc_msgSend_setConversationDetectMessageHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConversationDetectMessageHandler:];
}

id objc_msgSend_setConversationDetectSignal_(void *a1, const char *a2, ...)
{
  return [a1 setConversationDetectSignal:];
}

id objc_msgSend_setCrownRotationDirection_(void *a1, const char *a2, ...)
{
  return [a1 setCrownRotationDirection:];
}

id objc_msgSend_setCurrentCDDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentCDDeviceIdentifier:];
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return [a1 setDaemon:];
}

id objc_msgSend_setDarwinDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDarwinDevice:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDeclineDismissSkipConfig_(void *a1, const char *a2, ...)
{
  return [a1 setDeclineDismissSkipConfig:];
}

id objc_msgSend_setDefaultConfigurationsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 setDefaultConfigurationsIfNeeded];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationDevice:];
}

id objc_msgSend_setDetectedHeadGesture_(void *a1, const char *a2, ...)
{
  return [a1 setDetectedHeadGesture:];
}

id objc_msgSend_setDeviceActionType_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceActionType:];
}

id objc_msgSend_setDeviceAddress_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceAddress:];
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceChangedHandler:];
}

id objc_msgSend_setDeviceConnectedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceConnectedHandler:];
}

id objc_msgSend_setDeviceDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceDelegate:];
}

id objc_msgSend_setDeviceDisconnectedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceDisconnectedHandler:];
}

id objc_msgSend_setDeviceFlagsMask_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFlagsMask:];
}

id objc_msgSend_setDeviceFlagsValue_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFlagsValue:];
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFoundHandler:];
}

id objc_msgSend_setDeviceInfoChangeHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceInfoChangeHandler:];
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLostHandler:];
}

id objc_msgSend_setDeviceManager_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManager:];
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceName:];
}

id objc_msgSend_setDeviceVersion_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceVersion:];
}

id objc_msgSend_setDirectoryURL_(void *a1, const char *a2, ...)
{
  return [a1 setDirectoryURL:];
}

id objc_msgSend_setDisableCount_(void *a1, const char *a2, ...)
{
  return [a1 setDisableCount:];
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryFlags:];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDispatchSourceAbort_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchSourceAbort:];
}

id objc_msgSend_setDispatchSourceChange_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchSourceChange:];
}

id objc_msgSend_setDoubleTapActionLeft_(void *a1, const char *a2, ...)
{
  return [a1 setDoubleTapActionLeft:];
}

id objc_msgSend_setDoubleTapActionRight_(void *a1, const char *a2, ...)
{
  return [a1 setDoubleTapActionRight:];
}

id objc_msgSend_setDuckToLevelScalar_unduckToLevelScalar_error_(void *a1, const char *a2, ...)
{
  return [a1 setDuckToLevelScalar:x0 unduckToLevelScalar:x1 error:x2];
}

id objc_msgSend_setDuckingFadeOutDuration_fadeInDuration_error_(void *a1, const char *a2, ...)
{
  return [a1 setDuckingFadeOutDuration:fadeOutDuration fadeInDuration:fadeInDuration error:error];
}

id objc_msgSend_setEnableAudioFeedback_(void *a1, const char *a2, ...)
{
  return [a1 setEnableAudioFeedback:];
}

id objc_msgSend_setEnableCount_(void *a1, const char *a2, ...)
{
  return [a1 setEnableCount:];
}

id objc_msgSend_setEnableHearingAidGainSwipe_(void *a1, const char *a2, ...)
{
  return [a1 setEnableHearingAidGainSwipe:];
}

id objc_msgSend_setEnableHearingAssist_(void *a1, const char *a2, ...)
{
  return [a1 setEnableHearingAssist:];
}

id objc_msgSend_setEnableHeartRateMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setEnableHeartRateMonitor:];
}

id objc_msgSend_setEnableSiriMultitone_(void *a1, const char *a2, ...)
{
  return [a1 setEnableSiriMultitone:];
}

id objc_msgSend_setEndCallConfig_(void *a1, const char *a2, ...)
{
  return [a1 setEndCallConfig:];
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 setErrorHandler:];
}

id objc_msgSend_setEvalPreemptiveBannerResult_(void *a1, const char *a2, ...)
{
  return [a1 setEvalPreemptiveBannerResult:];
}

id objc_msgSend_setEvalResult_(void *a1, const char *a2, ...)
{
  return [a1 setEvalResult:];
}

id objc_msgSend_setEvalWxMap_(void *a1, const char *a2, ...)
{
  return [a1 setEvalWxMap:];
}

id objc_msgSend_setEvaluator_(void *a1, const char *a2, ...)
{
  return [a1 setEvaluator:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFalseRouteCheckForceDisconnectTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckForceDisconnectTimer:];
}

id objc_msgSend_setFalseRouteCheckHijackAwayTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckHijackAwayTimer:];
}

id objc_msgSend_setFalseRouteCheckHijackTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckHijackTimer:];
}

id objc_msgSend_setFalseRouteCheckOnDemandTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckOnDemandTimer:];
}

id objc_msgSend_setFalseRouteCheckOwnLostTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckOwnLostTimer:];
}

id objc_msgSend_setFalseRouteCheckProactiveRoutingTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckProactiveRoutingTimer:];
}

id objc_msgSend_setFalseRouteCheckReason_(void *a1, const char *a2, ...)
{
  return [a1 setFalseRouteCheckReason:];
}

id objc_msgSend_setFd_(void *a1, const char *a2, ...)
{
  return [a1 setFd:];
}

id objc_msgSend_setFence_withRadius_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setFence:withRadius:withCompletion:];
}

id objc_msgSend_setFirstPipeMessageRTT_(void *a1, const char *a2, ...)
{
  return [a1 setFirstPipeMessageRTT:];
}

id objc_msgSend_setFirstPreemptiveBannerShown_(void *a1, const char *a2, ...)
{
  return [a1 setFirstPreemptiveBannerShown:];
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFirstUnlockHandler:];
}

id objc_msgSend_setFirstUnlockStateWatcher_(void *a1, const char *a2, ...)
{
  return [a1 setFirstUnlockStateWatcher:];
}

id objc_msgSend_setFixedPIN_(void *a1, const char *a2, ...)
{
  return [a1 setFixedPIN:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setGracePeriod_(void *a1, const char *a2, ...)
{
  return [a1 setGracePeriod:];
}

id objc_msgSend_setGuestAddress_(void *a1, const char *a2, ...)
{
  return [a1 setGuestAddress:];
}

id objc_msgSend_setGuestKey_(void *a1, const char *a2, ...)
{
  return [a1 setGuestKey:];
}

id objc_msgSend_setGuestMode_(void *a1, const char *a2, ...)
{
  return [a1 setGuestMode:];
}

id objc_msgSend_setGuestPermanent_(void *a1, const char *a2, ...)
{
  return [a1 setGuestPermanent:];
}

id objc_msgSend_setHeadGestureToggle_(void *a1, const char *a2, ...)
{
  return [a1 setHeadGestureToggle:];
}

id objc_msgSend_setHeadGestureUpdateFlags_(void *a1, const char *a2, ...)
{
  return [a1 setHeadGestureUpdateFlags:];
}

id objc_msgSend_setHearingAidEnrolled_(void *a1, const char *a2, ...)
{
  return [a1 setHearingAidEnrolled:];
}

id objc_msgSend_setHearingAidToggle_(void *a1, const char *a2, ...)
{
  return [a1 setHearingAidToggle:];
}

id objc_msgSend_setHijackActiveRemoteScore_(void *a1, const char *a2, ...)
{
  return [a1 setHijackActiveRemoteScore:];
}

id objc_msgSend_setHijackAmbientTick_(void *a1, const char *a2, ...)
{
  return [a1 setHijackAmbientTick:];
}

id objc_msgSend_setHijackAnswer_(void *a1, const char *a2, ...)
{
  return [a1 setHijackAnswer:];
}

id objc_msgSend_setHijackAwayLocalScore_(void *a1, const char *a2, ...)
{
  return [a1 setHijackAwayLocalScore:];
}

id objc_msgSend_setHijackAwayRemoteScore_(void *a1, const char *a2, ...)
{
  return [a1 setHijackAwayRemoteScore:];
}

id objc_msgSend_setHijackCallTick_(void *a1, const char *a2, ...)
{
  return [a1 setHijackCallTick:];
}

id objc_msgSend_setHijackContinuousTimeoutCount_(void *a1, const char *a2, ...)
{
  return [a1 setHijackContinuousTimeoutCount:];
}

id objc_msgSend_setHijackInputTick_(void *a1, const char *a2, ...)
{
  return [a1 setHijackInputTick:];
}

id objc_msgSend_setHijackMediaTick_(void *a1, const char *a2, ...)
{
  return [a1 setHijackMediaTick:];
}

id objc_msgSend_setHijackPlayingApp_(void *a1, const char *a2, ...)
{
  return [a1 setHijackPlayingApp:];
}

id objc_msgSend_setHijackPlayingCategory_(void *a1, const char *a2, ...)
{
  return [a1 setHijackPlayingCategory:];
}

id objc_msgSend_setHijackRelaySent_(void *a1, const char *a2, ...)
{
  return [a1 setHijackRelaySent:];
}

id objc_msgSend_setHijackRoundTripTime_(void *a1, const char *a2, ...)
{
  return [a1 setHijackRoundTripTime:];
}

id objc_msgSend_setHijackScore_(void *a1, const char *a2, ...)
{
  return [a1 setHijackScore:];
}

id objc_msgSend_setHijackVersion_(void *a1, const char *a2, ...)
{
  return [a1 setHijackVersion:];
}

id objc_msgSend_setHmDeviceDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setHmDeviceDelegate:];
}

id objc_msgSend_setIcloudSignedIn_(void *a1, const char *a2, ...)
{
  return [a1 setIcloudSignedIn:];
}

id objc_msgSend_setIconAppIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIconAppIdentifier:];
}

id objc_msgSend_setIconName_(void *a1, const char *a2, ...)
{
  return [a1 setIconName:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdleTime_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTime:];
}

id objc_msgSend_setIdsDeviceID_(void *a1, const char *a2, ...)
{
  return [a1 setIdsDeviceID:];
}

id objc_msgSend_setIgnoreBTRestart_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreBTRestart:];
}

id objc_msgSend_setIgnoreManualConnect_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreManualConnect:];
}

id objc_msgSend_setInEar_(void *a1, const char *a2, ...)
{
  return [a1 setInEar:];
}

id objc_msgSend_setInEarDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setInEarDisabled:];
}

id objc_msgSend_setInputMuted_error_(void *a1, const char *a2, ...)
{
  return [a1 setInputMuted:error:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsAccountActive_(void *a1, const char *a2, ...)
{
  return [a1 setIsAccountActive:];
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return [a1 setIsConnected:];
}

id objc_msgSend_setIsFetchInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setIsFetchInProgress:];
}

id objc_msgSend_setIsFetchMasterKeyInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setIsFetchMasterKeyInProgress:];
}

id objc_msgSend_setIsFirstConnectionAfterSREnable_(void *a1, const char *a2, ...)
{
  return [a1 setIsFirstConnectionAfterSREnable:];
}

id objc_msgSend_setIsInEar_(void *a1, const char *a2, ...)
{
  return [a1 setIsInEar:];
}

id objc_msgSend_setIsReady_(void *a1, const char *a2, ...)
{
  return [a1 setIsReady:];
}

id objc_msgSend_setIsTipiHealingV2Eligible_(void *a1, const char *a2, ...)
{
  return [a1 setIsTipiHealingV2Eligible:];
}

id objc_msgSend_setIsUTPConnected_(void *a1, const char *a2, ...)
{
  return [a1 setIsUTPConnected:];
}

id objc_msgSend_setIsWatchingBuddy_(void *a1, const char *a2, ...)
{
  return [a1 setIsWatchingBuddy:];
}

id objc_msgSend_setIsWriteMasterKeysInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setIsWriteMasterKeysInProgress:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLastBatteryLevel_(void *a1, const char *a2, ...)
{
  return [a1 setLastBatteryLevel:];
}

id objc_msgSend_setLastBatteryType_(void *a1, const char *a2, ...)
{
  return [a1 setLastBatteryType:];
}

id objc_msgSend_setLastConnectHost_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectHost:];
}

id objc_msgSend_setLastConnectResult_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectResult:];
}

id objc_msgSend_setLastConnectTicks_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectTicks:];
}

id objc_msgSend_setLastConnectTime_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectTime:];
}

id objc_msgSend_setLastConnectionTicks_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectionTicks:];
}

id objc_msgSend_setLastEvalResult_(void *a1, const char *a2, ...)
{
  return [a1 setLastEvalResult:];
}

id objc_msgSend_setLastEvalTicks_(void *a1, const char *a2, ...)
{
  return [a1 setLastEvalTicks:];
}

id objc_msgSend_setLastPlay_(void *a1, const char *a2, ...)
{
  return [a1 setLastPlay:];
}

id objc_msgSend_setLastSeenTime_(void *a1, const char *a2, ...)
{
  return [a1 setLastSeenTime:];
}

id objc_msgSend_setLastWxAdvTicks_(void *a1, const char *a2, ...)
{
  return [a1 setLastWxAdvTicks:];
}

id objc_msgSend_setLeadingAccessoryImageName_(void *a1, const char *a2, ...)
{
  return [a1 setLeadingAccessoryImageName:];
}

id objc_msgSend_setLeeway_(void *a1, const char *a2, ...)
{
  return [a1 setLeeway:];
}

id objc_msgSend_setLidClosed_(void *a1, const char *a2, ...)
{
  return [a1 setLidClosed:];
}

id objc_msgSend_setListeningMode_(void *a1, const char *a2, ...)
{
  return [a1 setListeningMode:];
}

id objc_msgSend_setListeningModeConfigs_(void *a1, const char *a2, ...)
{
  return [a1 setListeningModeConfigs:];
}

id objc_msgSend_setListeningModeOffAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setListeningModeOffAllowed:];
}

id objc_msgSend_setLocalAudioScore_(void *a1, const char *a2, ...)
{
  return [a1 setLocalAudioScore:];
}

id objc_msgSend_setLocalDeviceName_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceName:];
}

id objc_msgSend_setLocalDeviceRandomAddress_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceRandomAddress:];
}

id objc_msgSend_setLocalizedPromptTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedPromptTitle:];
}

id objc_msgSend_setLowBatteryLevel_(void *a1, const char *a2, ...)
{
  return [a1 setLowBatteryLevel:];
}

id objc_msgSend_setLowestBudBatteryInfo_(void *a1, const char *a2, ...)
{
  return [a1 setLowestBudBatteryInfo:];
}

id objc_msgSend_setMXSessionProperty_value_error_(void *a1, const char *a2, ...)
{
  return [a1 setMXSessionProperty:x0 value:x1 error:x2];
}

id objc_msgSend_setMagnetConnected_(void *a1, const char *a2, ...)
{
  return [a1 setMagnetConnected:];
}

id objc_msgSend_setManualRouteChangeDetectionTimer_(void *a1, const char *a2, ...)
{
  return [a1 setManualRouteChangeDetectionTimer:];
}

id objc_msgSend_setManualRouteDestination_(void *a1, const char *a2, ...)
{
  return [a1 setManualRouteDestination:];
}

id objc_msgSend_setManualRouteInputOutput_(void *a1, const char *a2, ...)
{
  return [a1 setManualRouteInputOutput:];
}

id objc_msgSend_setMasterBlob_(void *a1, const char *a2, ...)
{
  return [a1 setMasterBlob:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return [a1 setMaxDelay:];
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumFractionDigits:];
}

id objc_msgSend_setMediaPlaying_(void *a1, const char *a2, ...)
{
  return [a1 setMediaPlaying:];
}

id objc_msgSend_setMessageIdentifiersWaitingForAck_(void *a1, const char *a2, ...)
{
  return [a1 setMessageIdentifiersWaitingForAck:];
}

id objc_msgSend_setMicrophoneMode_(void *a1, const char *a2, ...)
{
  return [a1 setMicrophoneMode:];
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return [a1 setMinDelay:];
}

id objc_msgSend_setMinRSSIHeadset_(void *a1, const char *a2, ...)
{
  return [a1 setMinRSSIHeadset:];
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return [a1 setMode:];
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return [a1 setModel:];
}

id objc_msgSend_setModifyOperationTimer_(void *a1, const char *a2, ...)
{
  return [a1 setModifyOperationTimer:];
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setModifyRecordZonesCompletionBlock:];
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setModifyRecordsCompletionBlock:];
}

id objc_msgSend_setMuteAction_auditToken_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setMuteAction:auditToken:bundleIdentifier:];
}

id objc_msgSend_setMuteAudioFeedback_(void *a1, const char *a2, ...)
{
  return [a1 setMuteAudioFeedback:];
}

id objc_msgSend_setMuteControlConfig_(void *a1, const char *a2, ...)
{
  return [a1 setMuteControlConfig:];
}

id objc_msgSend_setNSUUID_(void *a1, const char *a2, ...)
{
  return [a1 setNSUUID:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNearbyDeviceNoTipiScoreCount_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyDeviceNoTipiScoreCount:];
}

id objc_msgSend_setNeedsSetup_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsSetup:];
}

id objc_msgSend_setNetworkMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkMonitor:];
}

id objc_msgSend_setNickname_(void *a1, const char *a2, ...)
{
  return [a1 setNickname:];
}

id objc_msgSend_setNoNearbyDeviceFoundCount_(void *a1, const char *a2, ...)
{
  return [a1 setNoNearbyDeviceFoundCount:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOnDemandCategory_(void *a1, const char *a2, ...)
{
  return [a1 setOnDemandCategory:];
}

id objc_msgSend_setOneSourceLastRouteHost_(void *a1, const char *a2, ...)
{
  return [a1 setOneSourceLastRouteHost:];
}

id objc_msgSend_setOnlyDiscoversBluetoothDevices_(void *a1, const char *a2, ...)
{
  return [a1 setOnlyDiscoversBluetoothDevices:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOtherTipiDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return [a1 setOtherTipiDeviceAudioScore:];
}

id objc_msgSend_setOtherTipiDeviceIdleTick_(void *a1, const char *a2, ...)
{
  return [a1 setOtherTipiDeviceIdleTick:];
}

id objc_msgSend_setOtherTipiDeviceLastPlay_(void *a1, const char *a2, ...)
{
  return [a1 setOtherTipiDeviceLastPlay:];
}

id objc_msgSend_setOutOfCaseTime_(void *a1, const char *a2, ...)
{
  return [a1 setOutOfCaseTime:];
}

id objc_msgSend_setOverrideScreenOff_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideScreenOff:];
}

id objc_msgSend_setPairSetupDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setPairSetupDisabled:];
}

id objc_msgSend_setPaired_(void *a1, const char *a2, ...)
{
  return [a1 setPaired:];
}

id objc_msgSend_setPauseErrorReason_(void *a1, const char *a2, ...)
{
  return [a1 setPauseErrorReason:];
}

id objc_msgSend_setPeerDevice_(void *a1, const char *a2, ...)
{
  return [a1 setPeerDevice:];
}

id objc_msgSend_setPerRecordCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setPerRecordCompletionBlock:];
}

id objc_msgSend_setPipePendingRequest_(void *a1, const char *a2, ...)
{
  return [a1 setPipePendingRequest:];
}

id objc_msgSend_setPipeStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setPipeStartTime:];
}

id objc_msgSend_setPlacementMode_(void *a1, const char *a2, ...)
{
  return [a1 setPlacementMode:];
}

id objc_msgSend_setPreemptiveBannerShown_(void *a1, const char *a2, ...)
{
  return [a1 setPreemptiveBannerShown:];
}

id objc_msgSend_setPrimaryAppleIDChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryAppleIDChangedHandler:];
}

id objc_msgSend_setPrimaryInCase_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryInCase:];
}

id objc_msgSend_setPrimaryInEar_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryInEar:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProactiveRoutingBackoff_(void *a1, const char *a2, ...)
{
  return [a1 setProactiveRoutingBackoff:];
}

id objc_msgSend_setProactiveRoutingTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setProactiveRoutingTrigger:];
}

id objc_msgSend_setProactiveRoutingWxRSSI_(void *a1, const char *a2, ...)
{
  return [a1 setProactiveRoutingWxRSSI:];
}

id objc_msgSend_setProcessingIDSPush_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingIDSPush:];
}

id objc_msgSend_setProductID_(void *a1, const char *a2, ...)
{
  return [a1 setProductID:];
}

id objc_msgSend_setProgressHandler_(void *a1, const char *a2, ...)
{
  return [a1 setProgressHandler:];
}

id objc_msgSend_setProgressStarted_(void *a1, const char *a2, ...)
{
  return [a1 setProgressStarted:];
}

id objc_msgSend_setPromptStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPromptStyle:];
}

id objc_msgSend_setPublicAddress_(void *a1, const char *a2, ...)
{
  return [a1 setPublicAddress:];
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return [a1 setPurpose:];
}

id objc_msgSend_setPushQueue_(void *a1, const char *a2, ...)
{
  return [a1 setPushQueue:];
}

id objc_msgSend_setPushTimer_(void *a1, const char *a2, ...)
{
  return [a1 setPushTimer:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return [a1 setReason:];
}

id objc_msgSend_setReconnectionState_(void *a1, const char *a2, ...)
{
  return [a1 setReconnectionState:];
}

id objc_msgSend_setRelayMessageHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRelayMessageHandler:];
}

id objc_msgSend_setRelinquishAudioRoute_(void *a1, const char *a2, ...)
{
  return [a1 setRelinquishAudioRoute:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemotePID_(void *a1, const char *a2, ...)
{
  return [a1 setRemotePID:];
}

id objc_msgSend_setRemoteUID_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteUID];
}

id objc_msgSend_setReportTime_(void *a1, const char *a2, ...)
{
  return [a1 setReportTime:];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}

id objc_msgSend_setRequestPartGestures_(void *a1, const char *a2, ...)
{
  return [a1 setRequestPartGestures:];
}

id objc_msgSend_setRequestedKeyTypes_(void *a1, const char *a2, ...)
{
  return [a1 setRequestedKeyTypes:];
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return [a1 setResponseHandler:];
}

id objc_msgSend_setReverseRouteReason_(void *a1, const char *a2, ...)
{
  return [a1 setReverseRouteReason:];
}

id objc_msgSend_setRouteCheckHijackTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRouteCheckHijackTimer:];
}

id objc_msgSend_setRouteCheckInUseBannerTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRouteCheckInUseBannerTimer:];
}

id objc_msgSend_setRouteCheckOnDemandTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRouteCheckOnDemandTimer:];
}

id objc_msgSend_setRouteCheckOwnLostTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRouteCheckOwnLostTimer:];
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setRssiThreshold:];
}

id objc_msgSend_setSRConnectedSetCount_(void *a1, const char *a2, ...)
{
  return [a1 setSRConnectedSetCount:];
}

id objc_msgSend_setScanFlags_(void *a1, const char *a2, ...)
{
  return [a1 setScanFlags:];
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setScanRate:];
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setScreenLockedChangedHandler:];
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setScreenOnChangedHandler:];
}

id objc_msgSend_setSecondaryInCase_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryInCase:];
}

id objc_msgSend_setSecondaryInEar_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryInEar:];
}

id objc_msgSend_setSelectiveSpeechListeningConfig_(void *a1, const char *a2, ...)
{
  return [a1 setSelectiveSpeechListeningConfig:];
}

id objc_msgSend_setSenderIDS_(void *a1, const char *a2, ...)
{
  return [a1 setSenderIDS:];
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return [a1 setServerConnection:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setServiceFlags_(void *a1, const char *a2, ...)
{
  return [a1 setServiceFlags:];
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setServiceIdentifier:];
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceType:];
}

id objc_msgSend_setSessionEndedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSessionEndedHandler:];
}

id objc_msgSend_setSessionFlags_(void *a1, const char *a2, ...)
{
  return [a1 setSessionFlags:];
}

id objc_msgSend_setSessionStartedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSessionStartedHandler:];
}

id objc_msgSend_setSetupSupportsTipiv2_(void *a1, const char *a2, ...)
{
  return [a1 setSetupSupportsTipiv2:];
}

id objc_msgSend_setShouldPauseFetch_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPauseFetch:];
}

id objc_msgSend_setSigningIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setSigningIdentity:];
}

id objc_msgSend_setSiriMultitoneEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setSiriMultitoneEnabled:];
}

id objc_msgSend_setSleepWakeHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSleepWakeHandler:];
}

id objc_msgSend_setSmartRoutingMode_(void *a1, const char *a2, ...)
{
  return [a1 setSmartRoutingMode:];
}

id objc_msgSend_setSmartRoutingStateFlags_(void *a1, const char *a2, ...)
{
  return [a1 setSmartRoutingStateFlags:];
}

id objc_msgSend_setSnapshotLocalDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotLocalDeviceAudioScore:];
}

id objc_msgSend_setSnapshotLocalNumOfApps_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotLocalNumOfApps:];
}

id objc_msgSend_setSnapshotLocalPlayingApp_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotLocalPlayingApp:];
}

id objc_msgSend_setSnapshotLocalRoute_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotLocalRoute:];
}

id objc_msgSend_setSnapshotRemoteDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotRemoteDeviceAudioScore:];
}

id objc_msgSend_setSourceCount_(void *a1, const char *a2, ...)
{
  return [a1 setSourceCount:];
}

id objc_msgSend_setSpatialAudioAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setSpatialAudioAllowed:];
}

id objc_msgSend_setSpatialAudioMode_(void *a1, const char *a2, ...)
{
  return [a1 setSpatialAudioMode:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatusMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setStatusMonitor:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSubtitleArguments_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleArguments:];
}

id objc_msgSend_setSubtitleKey_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleKey:];
}

id objc_msgSend_setSupportsVirtualAddress_(void *a1, const char *a2, ...)
{
  return [a1 setSupportsVirtualAddress:];
}

id objc_msgSend_setTUCallMap_(void *a1, const char *a2, ...)
{
  return [a1 setTUCallMap:];
}

id objc_msgSend_setTargetFilename_(void *a1, const char *a2, ...)
{
  return [a1 setTargetFilename:];
}

id objc_msgSend_setThV2Ticks_(void *a1, const char *a2, ...)
{
  return [a1 setThV2Ticks:];
}

id objc_msgSend_setThV2WxCount_(void *a1, const char *a2, ...)
{
  return [a1 setThV2WxCount:];
}

id objc_msgSend_setTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutSeconds:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTipiChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setTipiChangedHandler:];
}

id objc_msgSend_setTipiHealingBackoff_(void *a1, const char *a2, ...)
{
  return [a1 setTipiHealingBackoff:];
}

id objc_msgSend_setTipitableUpdated_(void *a1, const char *a2, ...)
{
  return [a1 setTipitableUpdated:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitleArguments_(void *a1, const char *a2, ...)
{
  return [a1 setTitleArguments:];
}

id objc_msgSend_setTitleKey_(void *a1, const char *a2, ...)
{
  return [a1 setTitleKey:];
}

id objc_msgSend_setTotalCloudDeviceCount_(void *a1, const char *a2, ...)
{
  return [a1 setTotalCloudDeviceCount:];
}

id objc_msgSend_setTrailingAccessoryText_(void *a1, const char *a2, ...)
{
  return [a1 setTrailingAccessoryText:];
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setTransitionHandler:];
}

id objc_msgSend_setTriggered_(void *a1, const char *a2, ...)
{
  return [a1 setTriggered:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUnpairedIDSCloudIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setUnpairedIDSCloudIdentifiers:];
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return _[a1 setUp];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUserNotInContacts_(void *a1, const char *a2, ...)
{
  return [a1 setUserNotInContacts:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWxAddress_(void *a1, const char *a2, ...)
{
  return [a1 setWxAddress:];
}

id objc_msgSend_setWxDevice_(void *a1, const char *a2, ...)
{
  return [a1 setWxDevice:];
}

id objc_msgSend_setWxInfo_(void *a1, const char *a2, ...)
{
  return [a1 setWxInfo:];
}

id objc_msgSend_setWxStreamState_(void *a1, const char *a2, ...)
{
  return [a1 setWxStreamState:];
}

id objc_msgSend_setWxTipiScore1_(void *a1, const char *a2, ...)
{
  return [a1 setWxTipiScore1:];
}

id objc_msgSend_setWxTipiScore2_(void *a1, const char *a2, ...)
{
  return [a1 setWxTipiScore2:];
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return [a1 setXpcCnx:];
}

id objc_msgSend_setZeroSourceLastRouteHost_(void *a1, const char *a2, ...)
{
  return [a1 setZeroSourceLastRouteHost:];
}

id objc_msgSend_setupSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 setupSubscriptions];
}

id objc_msgSend_setupSupportsTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 setupSupportsTipiv2];
}

id objc_msgSend_setuserPreference_value_sync_(void *a1, const char *a2, ...)
{
  return [a1 setuserPreference:value:sync:];
}

id objc_msgSend_sfSession(void *a1, const char *a2, ...)
{
  return _[a1 sfSession];
}

id objc_msgSend_shareAudioProgressEvent_info_(void *a1, const char *a2, ...)
{
  return [a1 shareAudioProgressEvent:info:];
}

id objc_msgSend_shareAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 shareAudioSession];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAADeviceManagerDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedAADeviceManagerDaemon];
}

id objc_msgSend_sharedAAServicesDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedAAServicesDaemon];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedBTIdentityDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTIdentityDaemon];
}

id objc_msgSend_sharedBTServicesDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTServicesDaemon];
}

id objc_msgSend_sharedBTSmartRoutingDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTSmartRoutingDaemon];
}

id objc_msgSend_sharedCDSessionManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedCDSessionManager];
}

id objc_msgSend_sharedContextManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedContextManager];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedHMServiceDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedHMServiceDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_shouldClientWithAudioScore_hijackRoute_hijackDeniedReason_(void *a1, const char *a2, ...)
{
  return [a1 shouldClientWithAudioScore:x0 hijackRoute:x1 hijackDeniedReason:x2];
}

id objc_msgSend_shouldPauseFetch(void *a1, const char *a2, ...)
{
  return _[a1 shouldPauseFetch];
}

id objc_msgSend_shouldUpgradeToManatee(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpgradeToManatee];
}

id objc_msgSend_showCrashBannerIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 showCrashBannerIfNeeded:];
}

id objc_msgSend_signingIdentity(void *a1, const char *a2, ...)
{
  return _[a1 signingIdentity];
}

id objc_msgSend_singleton(void *a1, const char *a2, ...)
{
  return _[a1 singleton];
}

id objc_msgSend_siriMultitoneCapability(void *a1, const char *a2, ...)
{
  return _[a1 siriMultitoneCapability];
}

id objc_msgSend_siriMultitoneEnabled(void *a1, const char *a2, ...)
{
  return _[a1 siriMultitoneEnabled];
}

id objc_msgSend_smartRoutingMode(void *a1, const char *a2, ...)
{
  return _[a1 smartRoutingMode];
}

id objc_msgSend_smartRoutingStateFlags(void *a1, const char *a2, ...)
{
  return _[a1 smartRoutingStateFlags];
}

id objc_msgSend_smartRoutingStateUpdated_ForDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "smartRoutingStateUpdated:ForDeviceIdentifier:");
}

id objc_msgSend_smoothedRSSI(void *a1, const char *a2, ...)
{
  return _[a1 smoothedRSSI];
}

id objc_msgSend_snapshotLocalDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalDeviceAudioScore];
}

id objc_msgSend_snapshotLocalNumOfApps(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalNumOfApps];
}

id objc_msgSend_snapshotLocalPlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalPlayingApp];
}

id objc_msgSend_snapshotLocalRoute(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalRoute];
}

id objc_msgSend_snapshotRemoteDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 snapshotRemoteDeviceAudioScore];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceCount(void *a1, const char *a2, ...)
{
  return _[a1 sourceCount];
}

id objc_msgSend_spatialAudioAllowed(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioAllowed];
}

id objc_msgSend_spatialAudioMode(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioMode];
}

id objc_msgSend_speakText_flags_completion_(void *a1, const char *a2, ...)
{
  return [a1 speakText:x0 flags:x1 completion:x2];
}

id objc_msgSend_speechDetectionStyle(void *a1, const char *a2, ...)
{
  return _[a1 speechDetectionStyle];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return _[a1 standardizedURL];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startHeadGestureManagerWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 startHeadGestureManagerWithFlags:];
}

id objc_msgSend_startMonitoringWithCallback_(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringWithCallback:];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return _[a1 startSession];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateString(void *a1, const char *a2, ...)
{
  return _[a1 stateString];
}

id objc_msgSend_statedumpAndRecordDailyMetric(void *a1, const char *a2, ...)
{
  return _[a1 statedumpAndRecordDailyMetric];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopHeadGestureManager(void *a1, const char *a2, ...)
{
  return _[a1 stopHeadGestureManager];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoring];
}

id objc_msgSend_storePublicAddressMapping_message_(void *a1, const char *a2, ...)
{
  return [a1 storePublicAddressMapping:message];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_submitHijackMetric_withV1_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "submitHijackMetric:withV1:");
}

id objc_msgSend_submitRouteActivityMetric_activity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "submitRouteActivityMetric:activity:");
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionID];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return _[a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_supportsVirtualAddress(void *a1, const char *a2, ...)
{
  return _[a1 supportsVirtualAddress];
}

id objc_msgSend_supportsiCloudPairing(void *a1, const char *a2, ...)
{
  return _[a1 supportsiCloudPairing];
}

id objc_msgSend_targetFilename(void *a1, const char *a2, ...)
{
  return _[a1 targetFilename];
}

id objc_msgSend_thV2Ticks(void *a1, const char *a2, ...)
{
  return _[a1 thV2Ticks];
}

id objc_msgSend_thV2WxCount(void *a1, const char *a2, ...)
{
  return _[a1 thV2WxCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return _[a1 timeStamp];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_tipiAndRoutedState(void *a1, const char *a2, ...)
{
  return _[a1 tipiAndRoutedState];
}

id objc_msgSend_tipiConnectionStatus(void *a1, const char *a2, ...)
{
  return _[a1 tipiConnectionStatus];
}

id objc_msgSend_tipiDevices(void *a1, const char *a2, ...)
{
  return _[a1 tipiDevices];
}

id objc_msgSend_tipiHealingBackoff(void *a1, const char *a2, ...)
{
  return _[a1 tipiHealingBackoff];
}

id objc_msgSend_tipiState(void *a1, const char *a2, ...)
{
  return _[a1 tipiState];
}

id objc_msgSend_tipitableUpdated(void *a1, const char *a2, ...)
{
  return _[a1 tipitableUpdated];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toggleInputMute(void *a1, const char *a2, ...)
{
  return _[a1 toggleInputMute];
}

id objc_msgSend_toggleInputMute_(void *a1, const char *a2, ...)
{
  return [a1 toggleInputMute:];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_totalCloudDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 totalCloudDeviceCount];
}

id objc_msgSend_trailingAccessoryText(void *a1, const char *a2, ...)
{
  return _[a1 trailingAccessoryText];
}

id objc_msgSend_transactionIdentifierForActionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 transactionIdentifierForActionIdentifier:];
}

id objc_msgSend_transactionQueue(void *a1, const char *a2, ...)
{
  return _[a1 transactionQueue];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggered(void *a1, const char *a2, ...)
{
  return _[a1 triggered];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uiDataSource(void *a1, const char *a2, ...)
{
  return _[a1 uiDataSource];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_unpairedIDSCloudIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 unpairedIDSCloudIdentifiers];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateAADeviceRecordWithRecord_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateAADeviceRecordWithRecord:completion:");
}

id objc_msgSend_updateAAProxCardsInfoWithProxCardsInfo_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateAAProxCardsInfoWithProxCardsInfo:completion:");
}

id objc_msgSend_updateActiveAccount_(void *a1, const char *a2, ...)
{
  return [a1 updateActiveAccount:];
}

id objc_msgSend_updateCloudKitAccessoryZone_delete_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateCloudKitAccessoryZone:delete:");
}

id objc_msgSend_updateCloudKitBlobZone_(void *a1, const char *a2, ...)
{
  return [a1 updateCloudKitBlobZone:];
}

id objc_msgSend_updateCloudPairings_newDevices_(void *a1, const char *a2, ...)
{
  return [a1 updateCloudPairings:newDevices:];
}

id objc_msgSend_updateDeviceMagicSettingsWithMagicPairingSettings_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceMagicSettingsWithMagicPairingSettings:completion:];
}

id objc_msgSend_updateDeviceSupportInformationWithDevice_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateDeviceSupportInformationWithDevice:completion:");
}

id objc_msgSend_updateHMDeviceCloudRecordInfoWithRecordInfo_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateHMDeviceCloudRecordInfoWithRecordInfo:completion:");
}

id objc_msgSend_updateIdentities_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateIdentities:completion:];
}

id objc_msgSend_updateWithAADeviceInfo_(void *a1, const char *a2, ...)
{
  return [a1 updateWithAADeviceInfo:];
}

id objc_msgSend_updateWithAADeviceRecord_(void *a1, const char *a2, ...)
{
  return [a1 updateWithAADeviceRecord:];
}

id objc_msgSend_updateWithCBDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateWithCBDevice:];
}

id objc_msgSend_upgradeAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 upgradeAccessoryBlob:withRetryCount:];
}

id objc_msgSend_upgradeLegacyNonManateeContainerToManatee(void *a1, const char *a2, ...)
{
  return _[a1 upgradeLegacyNonManateeContainerToManatee];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userConfirmed_(void *a1, const char *a2, ...)
{
  return [a1 userConfirmed:];
}

id objc_msgSend_userConnectedState(void *a1, const char *a2, ...)
{
  return _[a1 userConnectedState];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateCloudPairing_(void *a1, const char *a2, ...)
{
  return [a1 validateCloudPairing:];
}

id objc_msgSend_validateKeys_requestedTypes_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validateKeys:requestedTypes:from:");
}

id objc_msgSend_validateMessage_from_(void *a1, const char *a2, ...)
{
  return [a1 validateMessage:from:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_valuesByKey(void *a1, const char *a2, ...)
{
  return _[a1 valuesByKey];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_verifyAndCacheSubscriptionID_(void *a1, const char *a2, ...)
{
  return [a1 verifyAndCacheSubscriptionID:];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_writeAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 writeAccessoryBlob:withRetryCount:];
}

id objc_msgSend_writeKeyBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 writeKeyBlob:withRetryCount:];
}

id objc_msgSend_wxAddress(void *a1, const char *a2, ...)
{
  return _[a1 wxAddress];
}

id objc_msgSend_wxInfo(void *a1, const char *a2, ...)
{
  return _[a1 wxInfo];
}

id objc_msgSend_wxStreamState(void *a1, const char *a2, ...)
{
  return _[a1 wxStreamState];
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return _[a1 xpcCnx];
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnectionInvalidated];
}

id objc_msgSend_xpcObjectRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 xpcObjectRepresentation];
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return _[a1 xpcQueue];
}

id objc_msgSend_xpcUpdateCloudPairings_(void *a1, const char *a2, ...)
{
  return [a1 xpcUpdateCloudPairings];
}

id objc_msgSend_zeroSourceLastRouteHost(void *a1, const char *a2, ...)
{
  return _[a1 zeroSourceLastRouteHost];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}