




import 'package:upnp/upnp.dart';

class upnp{


  upnp();


  Future<Map<String, dynamic>> getCurrentMediaInfo({Service service}) async{
    return await service.invokeAction("GetMediaInfo", {
      "InstanceID":"0"
    });
  }

  Future<Map<String, dynamic>> pauseCurrentMedia({Service service}) async{
    return await service.invokeAction("Pause", {
      "InstanceID":"0"
    });
  }

  Future<Map<String, dynamic>> playCurrentMedia({Service service, String Speed}) async{
    return await service.invokeAction("Play", {
      "InstanceID":"0",
      "Speed":Speed??"1"
    });
  }

  Future<Map<String, dynamic>> stopCurrentMedia({Service service}) async{
    return await service.invokeAction("Stop", {
      "InstanceID":"0",
    });
  }

  Future<Map<String, dynamic>> getTransportSettings({Service service}) async{
    return await service.invokeAction("GetTransportSettings", {
      "InstanceID":"0"
    });
  }

  ///Will get info on the track duration and the position it is in right now
  ///
  ///
  ///Example : {Track: 1, TrackDuration: 00:40:21, TrackMetaData: <DIDL-Lite xmlns="urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:upnp="urn:schemas-upnp-org:metadata-1-0/upnp/" xmlns:dlna="urn:schemas-dlna-org:metadata-1-0/" xmlns:sec="http://www.sec.co.kr/" xmlns:xbmc="urn:schemas-xbmc-org:metadata-1-0/"><item id="plugin://plugin.video.youtube/play/?video_id=XfcvX0P1b5g" parentID="" restricted="1"><dc:title>Bitcoin - Unmasking Satoshi Nakamoto</dc:title><dc:creator>Unknown</dc:creator><dc:publisher>Unknown</dc:publisher><upnp:genre>Unknown</upnp:genre><upnp:albumArtURI dlna:profileID="JPEG_TN">http://192.168.1.2:1602/thumb?path=image%3A%2F%2Fhttps%253a%252f%252fi.ytimg.com%252fvi%252fXfcvX0P1b5g%252fhqdefault.jpg%2F</upnp:albumArtURI><upnp:lastPlaybackTime>1969-12-31T23:59:59+04:36</upnp:lastPlaybackTime><upnp:playbackCount>0</upnp:playbackCount><upnp:episodeSeason>0</upnp:episodeSeason><xbmc:dateadded>1969-12-31</xbmc:dateadded><xbmc:rating>0.0</xbmc:rating><xbmc:userrating>0</xbmc:userrating><upnp:class>object.item.videoItem</upnp:class></item></DIDL-Lite>, TrackURI: plugin://plugin.video.youtube/play/?video_id=XfcvX0P1b5g, RelTime: 00:00:10, AbsTime: 00:00:10, RelCount: 2147483647, AbsCount: 2147483647}
  Future<Map<String, dynamic>> getPositionInfo({Service service}) async{
    return await service.invokeAction("GetPositionInfo", {
      "InstanceID":"0"
    });
  }

  ///Return the current status of the playback
  ///
  ///
  ///Example : {CurrentTransportState: PAUSED_PLAYBACK, CurrentTransportStatus: OK, CurrentSpeed: 1}
  ///
  ///
  ///CurrentTransportState returned value can be on of the following :
  /// - PLAYING
  /// - PAUSED_PLAYBACK
  /// - STOPPED
  Future<Map<String, dynamic>> getTransportInfo({Service service}) async{
    return await service.invokeAction("GetTransportInfo", {
      "InstanceID":"0"
    });
  }


  ///Returns the device capabilities from playing and recording
  ///
  ///
  ///Example : {PlayMedia: NONE,NETWORK,HDD,CD-DA,UNKNOWN, RecMedia: NOT_IMPLEMENTED, RecQualityModes: NOT_IMPLEMENTED}
  Future<Map<String, dynamic>> getDeviceCapabilities({Service service}) async{
    return await service.invokeAction("GetDeviceCapabilities", {
      "InstanceID":"0"
    });
  }

  ///Returns the possible transport actions that can be called
  ///
  ///
  ///Example : {Actions: Play,Pause,Stop,Seek,Next,Previous}
  Future<Map<String, dynamic>> getTransportActions({Service service}) async{
    return await service.invokeAction("GetCurrentTransportActions", {
      "InstanceID":"0"
    });
  }

  ///Sets teh PlayMode to playmode argument
  ///
  ///
  ///Play Modes are one of the following :
  ///
  ///
  /// NORMAL :
  ///
  ///
  /// SHUFFLE :
  ///
  ///
  /// REPEAT_ONE :
  ///
  ///
  /// REPEAT_ALL :
  ///
  ///
  /// RANDOM :
  ///
  ///
  /// DIRECT_1 : Will only play the first track then completely stop
  ///
  ///
  /// INTRO : Will only play 1à seconds of each track then stop after playing (the 10 seconds) all of the tracks
  ///
  ///
  Future<Map<String, dynamic>> setPlayMode({Service service, String playmode}) async{
    return await service.invokeAction("GetCurrentTransportActions", {
      "InstanceID":"0",
      "NewPlayMode":playmode??"NORMAL"
    });
  }

  ///Will set the next item in the playlist To be early buffered
  ///
  ///
  ///[Objectclass] is a the type definition of the item to be played it can be of the following :
  ///
  ///
  /// - object.item.imageItem
  ///
  ///
  /// - object.item.audioItem
  ///
  ///
  /// - object.item.videoItem
  ///
  ///
  /// - object.item.playlistItem
  ///
  ///
  /// - object.item.textItem
  ///
  ///
  /// - object.item.bookmarkItem
  ///
  ///
  /// - object.item.epgItem
  ///
  ///
  /// Please visit the following source for more information
  ///
  ///
  /// Source : https://www.researchgate.net/figure/UPnP-DIDL-Lite-Metadata-Model-Listing-1-Abstract-DID-Model-The-abstract-DID-model-has_fig1_237063436
  ///
  /// [creator] is equivalent to author or artist and is just a string
  ///
  ///
  /// [uri] is the uri for the file, it should be public and accessible over http ( this is not a final version )
  Future<Map<String, dynamic>> setNextURI({Service service, String uri, String title, String creator, String Objectclass}) async{
    return await service.invokeAction("SetNextAVTransportURI", {
      "InstanceID":"0",
      "NextURI":uri??"",
      "NextURIMetaData":'<CurrentURIMetaData>&lt;DIDL-Lite xmlns="urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/" xmlns:upnp="urn:schemas-upnp-org:metadata-1-0/upnp/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sec="http://www.sec.co.kr/"&gt;&lt;item id="f-0" parentID="0" restricted="0"&gt;&lt;dc:title&gt;${title??"Untitled"}&lt;/dc:title&gt;&lt;dc:creator&gt;${creator??"NoCreator"}&lt;/dc:creator&gt;&lt;upnp:class&gt;${Objectclass??"object.item.videoItem"}&lt;/upnp:class&gt;&lt;res protocolInfo="*:*:audio:*" sec:URIType="public"&gt;${uri??""}&lt;/res&gt;&lt;/item&gt;&lt;/DIDL-Lite&gt;</CurrentURIMetaData>'
    });
  }


  ///This will override the current URI
  ///
  ///
  ///[Objectclass] is a the type definition of the item to be played it can be of the following :
  ///
  ///
  /// - object.item.imageItem
  ///
  ///
  /// - object.item.audioItem
  ///
  ///
  /// - object.item.videoItem
  ///
  ///
  /// - object.item.playlistItem
  ///
  ///
  /// - object.item.textItem
  ///
  ///
  /// - object.item.bookmarkItem
  ///
  ///
  /// - object.item.epgItem
  ///
  ///
  /// Please visit the following source for more information
  ///
  ///
  /// Source : https://www.researchgate.net/figure/UPnP-DIDL-Lite-Metadata-Model-Listing-1-Abstract-DID-Model-The-abstract-DID-model-has_fig1_237063436
  ///
  ///
  /// [creator] is equivalent to author or artist and is just a string
  ///
  ///
  /// [uri] is the uri for the file, it should be public and accessible over http ( this is not a final version )
  Future<Map<String, dynamic>> setCurrentURI({Service service, String uri, String title, String creator, String Objectclass}) async{
    print(service.actionNames);
    print(service.id);
    print(service.controlUrl);
    print(service.device.url);
    print(service.device.friendlyName);
    print(service.device.deviceType);
    print(await service.device.getService("urn:schemas-upnp-org:service:AVTransport:1"));
    print(uri);
    return await service.invokeAction("SetAVTransportURI", {
      "InstanceID":"0",
      "CurrentURI":uri??"",
      "CurrentURIMetaData":'<DIDL-Lite xmlns="urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/" xmlns:upnp="urn:schemas-upnp-org:metadata-1-0/upnp/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sec="http://www.sec.co.kr/"><item id="f-0" parentID="0" restricted="0"><dc:title>${title??"Untitled"}</dc:title><dc:creator>${creator??"NoCreator"}</dc:creator><upnp:class>${Objectclass??"object.item.videoItem"}</upnp:class><res protocolInfo="*:*:audio:*" sec:URIType="public">${uri??""}</res></item></DIDL-Lite>'
    });
  }

  Future<Map<String, dynamic>> goToPrevious({Service service}) async{
    return await service.invokeAction("Previous", {
      "InstanceID":"0"
    });
  }

  Future<Map<String, dynamic>> goToNext({Service service}) async{
    return await service.invokeAction("Next", {
      "InstanceID":"0"
    });
  }

  ///Seeks the current playing track to a specific position
  ///[position] is an absolute value and needs to be in this format : HH:MM:SS
  ///where HH is hours, MM is minutes and SS is seconds
  ///Example : 00:01:00
  Future<Map<String, dynamic>> seekPostion({Service service, String position}) async{
    return await service.invokeAction("Seek", {
      "InstanceID":"0",
      "Unit":"REL_TIME",
      "Target":position??"00:01:00"
    });
  }

  Future<List<Device>> getDevices() async{
    List<Device> listOfDevicesThatSupportAVTransport=[];
    var disc = new DeviceDiscoverer();
    await disc.start(ipv6: false);
    Stream discoverStream = disc.quickDiscoverClients();
    await discoverStream.forEach((client) async {
      try {
        Device dev = await client.getDevice();
        var result = await dev.getService("urn:schemas-upnp-org:service:AVTransport:1");
        if(result!=null){
          listOfDevicesThatSupportAVTransport.add(dev);
        }
      } catch (e, stack) {
        print("ERROR: ${e} - ${client.location}");
        print(stack);
      }
    });

    return listOfDevicesThatSupportAVTransport;
  }


  
  Future<Service> getAVTTransportServiceFromDevice(Device dev) async{
    Service result = await dev.getService("urn:schemas-upnp-org:service:AVTransport:1");
    return result;
  }

}