@interface NSURL(FaceTime_PhoneNumber)
+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:audioOnly:forceAssist:suppressAssist:wasAssisted:;
+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:forceAssist:suppressAssist:wasAssisted:;
@end

@implementation NSURL(FaceTime_PhoneNumber)

+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:forceAssist:suppressAssist:wasAssisted:
{
  return [a1 faceTimeURLWithDestinationID:a3 addressBookUID:a4 forceAssist:a5 suppressAssist:a6 wasAssisted:a7 audioOnly:0];
}

+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:audioOnly:forceAssist:suppressAssist:wasAssisted:
{
  return [a1 faceTimeURLWithDestinationID:a3 addressBookUID:a4 forceAssist:a6 suppressAssist:a7 wasAssisted:a8 audioOnly:a5];
}

@end