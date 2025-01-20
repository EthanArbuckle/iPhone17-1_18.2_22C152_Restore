@interface MRDGroupSessionProvider
+ (id)createRemoteControlSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5;
+ (id)remoteControlSessionForExistingSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
@end

@implementation MRDGroupSessionProvider

+ (id)createRemoteControlSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5
{
  return +[MRDRemoteControlGroupSession hostedSessionWithNearbyGroup:a3 nearbyInvitation:a4 identity:a5];
}

+ (id)remoteControlSessionForExistingSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  return +[MRDRemoteControlGroupSession remoteSessionWithNearbyGroup:a3 identity:a4 hostSigningKey:a5 joinToken:a6];
}

@end